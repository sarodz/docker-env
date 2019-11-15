#!/usr/bin/env python
# This is the file that implements a flask server to do inferences. It's the file that you will modify to
# implement the scoring for your own algorithm.

import os
import json
import pickle
import io
import sys
import signal
import traceback

import flask

import pandas as pd
import numpy as np
from flask_cors import CORS

prefix = '/opt/ml/'
model_path = os.path.join(prefix, 'model')

# A singleton for holding the model. This simply loads the model and holds it.
# It has a predict function that does a prediction based on the model and the input data.
# 
# class ScoringService(object):
#     model = None                # Where we keep the model when it's loaded
# 
#     @classmethod
#     def get_model(cls):
#         """Get the model object for this instance, loading it if it's not already loaded."""
#         if cls.model == None:
#             with open(os.path.join(model_path, 'decision-tree-model.pkl'), 'rb') as inp:
#                 cls.model = pickle.load(inp, encoding='bytes', fix_imports=True)
#         return cls.model
# 
#     @classmethod
#     def predict(cls, input):
#         """For the input, do the predictions and return them.
# 
#         Args:
#             input (a pandas dataframe): The data on which to do the predictions. There will be
#                 one prediction per row in the dataframe"""
#         clf = cls.get_model()
#         return clf.predict(input)
# 
class Handler(object):
    model = None

    @classmethod
    def parse_input(cls, input):
        """For the input, return set of budget options.

        Args:
            input (a pandas dataframe): The settings for the simulation
        """
        print("Invoked Handler")
        return None

# The flask app for serving predictions
app = flask.Flask(__name__)
CORS(app)

@app.route('/ping', methods=['GET'])
def ping():
    """Determine if the container is working and healthy. In this sample container, we declare
    it healthy if we can load the model successfully."""
    health = ScoringService.get_model() is not None  # You can insert a health check here

    status = 200 if health else 404
    return flask.Response(response='\n', status=status, mimetype='application/json')

@app.route('/invocations', methods=['POST'])
def transformation():
    """Do an inference on a single batch of data. In this sample server, we take data as CSV, convert
    it to a pandas data frame for internal use and then convert the predictions back to CSV (which really
    just means one prediction per line, since there's a single column.
    """
    data = None

    if flask.request.data is None:
        return flask.Response(response='Data is empty', status=420, mimetype='text/plain')
    # Convert from CSV to pandas
    #if flask.request.content_type == 'text/csv':
    #    data = flask.request.data.decode('utf-8')
    #    s = io.StringIO(data)
    #    data = pd.read_csv(s, header=None, engine='python')
    if flask.request.content_type == 'text/json':
        data = flask.request.data.decode('utf-8')
        s = io.StringIO(data)
        data = pd.read_json(s) 
    elif flask.request.content_type == 'application/json':
        data = flask.request.get_json(force=True)
        data = pd.DataFrame(data, index=[0])
    else:
        return flask.Response(response='This predictor only supports JSON data', status=415, mimetype='text/plain')

    print(data)
    print('Invoked with {} records'.format(data.shape[0]))

    # Do the prediction
    n = 10000
    predictions = 500*np.random.rand(n, data.shape[1])
    predictions = np.round(predictions).astype(int)

    # Convert from numpy back to CSV
    out = io.StringIO()
    D = { data.columns[i]: predictions[:,i] for i in range(data.shape[1]) }
    pd.DataFrame(D).to_csv(out, header=False, index=False)
    result = out.getvalue()
    resp = flask.Response(response=result, status=200, mimetype='text/csv')
    resp.headers.add('Access-Control-Allow-Origin', '*')
    #resp.headers['Access-Control-Allow-Origin'] = '*'
    return resp 
