FROM ckeyer/dev:go

MAINTAINER Chuanjian Wang <me@ckeyer.com>

ENV TF_TYPE=cpu
ENV TF_VERSION=1.3.0

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN curl -L "https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-$TF_TYPE-linux-x86_64-$TF_VERSION.tar.gz" | tar -C /usr/local -xz
