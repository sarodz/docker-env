FROM mathematicalmichael/math-user:stable
USER root
RUN apt-get update && \
    apt-get upgrade --yes && \ 
    apt-get install --yes screen && \
    apt-get install --yes tmux && \
    apt-get install --yes ssh && \
    apt-get install --yes imagemagick && \
    apt-get clean --yes

# ripgrep: fastest regex search available.
RUN curl -L https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb> ripgrep.deb && dpkg -i ripgrep.deb && rm ripgrep.deb

# HUGO
USER root
ENV HUGO_VER=0.53
RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.deb
RUN dpkg -i hugo*.deb
RUN rm hugo*.deb

USER $NB_UID
RUN python3 -m pip install markdown2
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
RUN echo "bind '\"\e[A\": history-search-backward'" >> ~/.bashrc && \
    echo "bind '\"\e[B\": history-search-forward'" >> ~/.bashrc && \
    echo "export EDITOR=/usr/bin/vim" >> /home/jovyan/.bashrc && \
    echo "export PAGER=less" >> /home/jovyan/.bashrc

RUN jupyter nbextension enable snippets_menu/main && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable codefolding/edit && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable notify/notify && \
    jupyter nbextension enable rubberband/main && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable latex_envs/latex_envs && \
    jupyter nbextension enable load_tex_macros/main && \
    jupyter nbextension enable toc2/main
