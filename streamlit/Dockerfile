FROM mathematicalmichael/python-tflow-pro
RUN pip install streamlit jupyter-server-proxy jupyter-rsession-proxy
RUN pip install \
    matplotlib \
    pandas \
    scipy \
    nose \
    pytest \
    autopep8 \
    black \
    codecov \
    pyDOE 
ENV JUPYTER_ENABLE_LAB=yes

RUN pip install opencv-python

#USER root
# streamlit-specific commands
#RUN mkdir -p $HOME/.streamlit
#RUN bash -c 'echo -e "\
#[general]\n\
#email = \"\"\n\
#" > $HOME/.streamlit/credentials.toml'
#RUN bash -c 'echo -e "\
#[server]\n\
#enableCORS = false\n\
#" > $HOME/.streamlit/config.toml'

#USER $NB_USER
#echo "helo"
