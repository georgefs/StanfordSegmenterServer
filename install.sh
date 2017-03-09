#!/bin/sh

wget http://nlp.stanford.edu/software/stanford-segmenter-2015-12-09.zip
unzip stanford-segmenter-2015-12-09.zip
rm -f stanford-segmenter-2015-12-09.zip
cp -r stanford-segmenter-2015-12-09/*.jar lib
rm -rf stanford-segmenter-2015-12-09/

sh make.sh
