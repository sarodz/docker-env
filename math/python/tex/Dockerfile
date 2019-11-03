FROM python-min

USER root
COPY ./tex_preq.sh ./tmp/tex_preq.sh
RUN ./tmp/tex_preq.sh && rm ./tmp/tex_preq.sh

USER $NB_UID
