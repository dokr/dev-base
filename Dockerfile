FROM ckeyer/dev:py3

MAINTAINER Chuanjian Wang <me@ckeyer.com>

ENV TF_VERSION=1.3.0

RUN pip3 --no-cache-dir install ipykernel jupyter matplotlib numpy scipy sklearn pandas;\
	python3 -m ipykernel.kernelspec; \
	pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-$TF_VERSION-cp34-cp34m-linux_x86_64.whl
