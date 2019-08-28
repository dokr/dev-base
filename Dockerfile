FROM tomcat:jdk8

ENV TZ=Asia/Shanghai
RUN apt update -y && \
	 apt install -y maven ca-certificates tzdata
