FROM python:3.8-slim-buster

ENV TZ=America/Los_Angeles
ENV PYTHONPATH=/usr/local/bin/python

RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get upgrade && apt-get -y install git curl zsh unzip wget tar openjdk-11-jdk && apt-get clean

ENV SPARKVERSION=spark-3.1.2-bin-hadoop3.2

RUN mkdir /usr/local/spark
# This downloads spark and unzips it to the /opt/spark directory
RUN wget https://mirrors.advancedhosters.com/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz \
  && tar -xvzf ${SPARKVERSION}.tgz -C  /usr/local/spark  --strip 1\
  && rm ${SPARKVERSION}.tgz

ENV SPARK_HOME=/usr/local/spark

# Install zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Make zsh the default shell
RUN chsh -s $(which zsh)

# Change zsh theme to agnoster
RUN sed -i 's+ZSH_THEME=\"robbyrussell\"+ZSH_THEME=\"agnoster\"+g' ~/.zshrc

# Change plugins to the ones I want
RUN sed -i 's/plugins=(git)/plugins=(git python pip colored-man-pages colorize vscode)/g' ~/.zshrc

WORKDIR /usr/src/sparkengine
COPY . /usr/src/sparkengine

# install needed packages
RUN pip install loguru pytest pandas black flake8 jupyter

# Add credentials for git
ARG GIT_USER="Paul Deveaux"
ARG GIT_EMAIL=paul@pauldeveaux.com

RUN git config --global user.name $GIT_USER && \
  git config --global user.email $GIT_EMAIL

