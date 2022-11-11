# mesh:0.0 : install dependencies
# sudo docker build . -t mesh:0.1
FROM ubuntu:22.04
ADD pip.conf /root/.pip/pip.conf
ADD ./sources.list /etc/apt/sources.list
ADD . /root
WORKDIR /root


RUN git clone https://github.com/FEniCS/basix.git
RUN git clone https://github.com/FEniCS/dolfinx.git
RUN git clone https://github.com/FEniCS/ffcx.git
RUN git clone https://github.com/FEniCS/ufl.git
RUN git clone https://github.com/xtensor-stack/xtensor.git
RUN git clone ttps://github.com/xtensor-stack/xtl.git

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y libdolfinx-dev ninja-build git
RUN cd $HOME/xtl/ && cmake . && make install
RUN cd $HOME/xtensor/ && cmake . && make install
RUN cd $HOME/ufl/ && pip install .
RUN cd $HOME/basix/ && pip install .
RUN cd $HOME/ffcx/ && pip install .
RUN cd $HOME/dolfinx/cpp/ && mkdir build && cd build && cmake .. && make -j8 install