#!/bin/sh

wget http://nlp.stanford.edu/software/stanford-segmenter-2015-12-09.zip
unzip stanford-segmenter-2015-12-09.zip
rm -f stanford-segmenter-2015-12-09.zip
cp stanford-segmenter-2015-12-09/* .
rm -rf stanford-segmenter-2015-12-09

unzip -o stanford-segmenter-3.6.0.jar
unzip -o slf4j-api.jar
unzip -o slf4j-simple.jar

mkdir -p service/impl
mkdir -p service/endp

sh make.sh
