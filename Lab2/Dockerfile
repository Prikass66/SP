FROM debian

RUN apt update
RUN apt install -y g++
RUN apt install -y gcc
RUN apt install -y gcc-multilib
RUN apt install -y gdb

COPY ./lab21.cpp .
COPY ./lab22.s .

RUN g++  -g ./lab21.cpp -o ./lab21
RUN gcc  -g -m32 -nostartfiles -no-pie ./lab22.s -o ./lab22






 
