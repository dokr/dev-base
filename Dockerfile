FROM ubuntu:16.04

ENV TZ=Asia/Shanghai
RUN apt update -y && \
	 apt install -y ca-certificates tzdata

RUN apt install -y openjdk-8-jdk openjfx maven
