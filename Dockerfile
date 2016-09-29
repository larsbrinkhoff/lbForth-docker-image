FROM ubuntu

RUN apt-get -q update
RUN apt-get install -y git gcc-multilib libc6-dev make sbcl
RUN git clone http://github.com/larsbrinkhoff/lbForth
RUN (cd lbForth && ./configure && make all install prefix=/usr)
RUN rm -rf lbForth
RUN apt-get purge -y git gcc-multilib libc6-dev make sbcl
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD forth
