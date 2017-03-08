FROM java:8

ADD . /work
WORKDIR /work

RUN install.sh

EXPOSE 9996
CMD run.sh
