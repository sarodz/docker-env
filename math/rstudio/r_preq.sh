# needs to run as root
# install rstudio-server
# I do not think these are necessary
#RUN apt-get update && \
#	apt-get install -y --no-install-recommends \
#	#		;
# R pre-requisites
apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc \
    libapparmor1 \
	libedit2 \
	lsb-release \
	psmisc \
	libssl1.0.0 \
    && rm -rf /var/lib/apt/lists/*

apt-get update && \
    curl --silent -L --fail https://download2.rstudio.org/rstudio-server-1.1.419-amd64.deb > /tmp/rstudio.deb && \
    echo '24cd11f0405d8372b4168fc9956e0386 /tmp/rstudio.deb' | md5sum -c - && \
    apt-get install -y /tmp/rstudio.deb && \
    rm /tmp/rstudio.deb

export PATH=$PATH:/usr/lib/rstudio-server/bin


#RUN apt-get install gdebi-core
curl --silent -L --fail https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb > /tmp/rshiny.deb && \
    apt-get install -y /tmp/rshiny.deb && \
    rm /tmp/rshiny.deb

# Fix for devtools https://github.com/conda-forge/r-devtools-feedstock/issues/4
if [ ! -f /bin/gtar ]; then ln -s /bin/tar /bin/gtar; fi
