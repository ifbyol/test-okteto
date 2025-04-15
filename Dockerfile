FROM ubuntu

ARG VAR1

RUN echo $VAR1 > ./test.txt
RUN cat ./test.txt

RUN echo "this is a test" > ./foo.txt
RUN cat ./foo.txt