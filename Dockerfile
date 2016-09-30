FROM ubuntu

ENV DEPS gcc-multilib libc6-dev make sbcl

RUN apt-get -q update
RUN apt-get install -y $DEPS
COPY lbForth .
RUN (cd lbForth && ./configure && make all install prefix=/usr)
RUN rm -rf lbForth
RUN apt-get purge -y $DEPS
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD forth
