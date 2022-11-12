# 在docker内部安装vnc环境，通过windows的远程桌面连接
FROM ubuntu:22.04
ADD pip.conf /root/.pip/pip.conf
# ADD ./sources.list /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-desktop 


RUN echo 'My final line 1' >> file.txt



