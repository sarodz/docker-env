FROM mathematicalmichael/math-user:stable
USER root
RUN apt-get update && \
    apt-get upgrade --yes && \ 
    apt-get install --yes screen && \
    apt-get install --yes ssh && \
    apt-get install --yes imagemagick && \
    apt-get clean --yes
# ripgrep: fastest regex search available.
RUN curl -L https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb> ripgrep.deb && dpkg -i ripgrep.deb && rm ripgrep.deb

USER $NB_UID
RUN python3 -m pip install markdown2
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
RUN echo "source ~/.bash_fzf" >> ~/.fzf.bash && \
echo "bind '\"\e[A\": history-search-backward'" >> ~/.bashrc && \
echo "bind '\"\e[B\": history-search-forward'" >> ~/.bashrc
