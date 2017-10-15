FROM ckeyer/dev:py3

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update lapack lapack-dev openblas openblas-dev libpng py3-cairo freetype freetype-dev ;\
	pip3 --no-cache-dir install ipykernel jupyter numpy scipy sklearn pandas matplotlib ;\
	python3 -m ipykernel.kernelspec

ENV TF_VERSION=1.3.0

RUN pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-$TF_VERSION-cp36-cp36m-linux_x86_64.whl
