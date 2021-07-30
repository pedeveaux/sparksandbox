FROM alpine:3.14
RUN apk update \
  && apk upgrade \
  && apk add git curl ca-certificates wget tar supervisor bash procps coreutils openjdk11

ENV SPARKVERSION spark-3.1.2-bin-hadoop3.2

RUN mkdir /opt/spark
# This downloads spark and unzips it to the /opt/spark directory
RUN wget https://mirrors.advancedhosters.com/apache/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz \
  && tar -xvzf ${SPARKVERSION}.tgz -C  /opt/spark  --strip 1\
  && rm ${SPARKVERSION}.tgz
# Need to unzip the tgz contents to the opt/spark folder then modify the PATH to be able to find spark

# RUN mv ${SPARKVERSION} /opt/spark

WORKDIR /usr/src/sparkengine
COPY . /usr/src/sparkengine

# CMD ["javac", "/usr/src/sparkengine/main.java"]
# ENTRYPOINT ["java" "main"]
