rm -rf lbForth
git clone --depth 1 http://github.com/larsbrinkhoff/lbForth
docker build -t larsbrinkhoff/lbforth .
#docker push larsbrinkhoff/lbforth:latest
