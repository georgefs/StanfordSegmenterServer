#!/bin/bash
mkdir -p service/impl
mkdir -p service/endp

javac -cp . SegService.java
mv -f SegService.class service/impl/

javac -cp . SegServiceImpl.java
mv -f SegServiceImpl.class service/impl/

javac SegServicePublisher.java
mv -f SegServicePublisher.class service/endp/
