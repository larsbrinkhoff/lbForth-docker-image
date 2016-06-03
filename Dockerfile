FROM ubuntu

RUN apt-get -q update
RUN apt-get install -y git gcc-multilib libc6-dev make sbcl
RUN git clone http://github.com/larsbrinkhoff/lbForth
RUN (cd lbForth && ./configure && make)
RUN rm -rf lbForth/.git lbForth/lisp lbForth/doc

WORKDIR /lbForth
CMD ./forth
