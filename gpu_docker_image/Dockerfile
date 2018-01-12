FROM gcr.io/tensorflow/tensorflow:latest-gpu

MAINTAINER Hassan Elhabbak <h.elhabbak@anchormen.nl>

RUN update-ca-certificates -f \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    wget \
    git \
    libatlas3-base \
    libopenblas-base \
  && apt-get clean \
  && git config --global http.sslverify false

ENV GIT_SSL_NO_VERIFY=false

# Java
RUN cd /opt/ \
  && wget \
    --no-cookies \
    --no-check-certificate \
    --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz" \
    -O jdk-8.tar.gz \
  && tar xzf jdk-8.tar.gz \
  && rm jdk-8.tar.gz \
  && update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_151/bin/java 100 \
  && update-alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_151/bin/jar 100 \
  && update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_151/bin/javac 100

# SPARK
RUN cd /usr/ \
  && wget "http://apache.mirrors.spacedump.net/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz" \
  && tar xzf spark-2.2.0-bin-hadoop2.7.tgz \
  && rm spark-2.2.0-bin-hadoop2.7.tgz \
  && mv spark-2.2.0-bin-hadoop2.7 spark

ENV SPARK_HOME /usr/spark
ENV SPARK_MAJOR_VERSION 2
ENV PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.4-src.zip:$SPARK_HOME/python/:$PYTHONPATH

RUN mkdir -p /usr/spark/work/ \
  && chmod -R 777 /usr/spark/work/

ENV SPARK_MASTER_PORT 7077

# pip install

RUN pip install --upgrade pip \
  && pip install pylint coverage --quiet \
  && apt-get -y install python3-pip

# tensorflow libs

RUN pip3 install tensorflow


CMD /usr/spark/bin/spark-class org.apache.spark.deploy.master.Master

ENV PATH="/usr/spark/bin:${PATH}"

# Copying script
COPY deep_learning.py /
