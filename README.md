# Stanford Segmenter Server

## Introduction

斷詞是中文自然語言處理中的重要步驟，如果你也是用Python，一般中文斷詞最常見的就是結巴斷詞，有時候也會自己收集詞組作斷詞。有一個先進的斷詞器很少人使用，那就是Stanford segmenter。

Stanford segmenter很少人用，是因為它是用Java寫成的，執行時需要花5秒載入資料。如果像我一樣寫Python的人，雖然可以寫一個介面去呼叫，但每次斷詞都要花5秒載入資料，太浪費時間了。所以最好的方法就是將它改寫成一個SOAP service，然後透過Python呼叫。

因為我的Java能力十分不專業，所以安裝過程可能有許多不合理的地方，請見諒。

Stadford segmenter的演算法論文可以參考: [Pi-Chuan Chang, Michel Galley and Chris Manning. 2008. Optimizing Chinese Word Segmentation for Machine Translation Performance](http://nlp.stanford.edu/pubs/acl-wmt08-cws.pdf)。


## Installation

1. 首先到[Stanford Word Segmenter](http://nlp.stanford.edu/software/segmenter.shtml)下載[Stanford Word Segmenter version 3.5.2](http://nlp.stanford.edu/software/stanford-segmenter-2015-12-09.zip)。
2. 將壓縮檔解壓後，應該會有一個獨立的`stanford-segmenter-2015-12-09`目錄，將這個repository中的所有檔案都複製到該目錄下。
3. 在目錄下解壓縮以下的檔案
    * `stanford-segmenter-3.6.0.jar`
    * `slf4j-api.jar`
    * `slf4j-simple.jar`
    * 解壓縮後，目錄下應該會多出`edu`, `org`, `META-INF`等目錄
4. 確定你有安裝Java SDK 8，並執行`make.sh`，裡面作的事情很簡單
    * 建立目錄 `service`
    * 建立目錄 `service/impl`
    * 建立目錄 `service/endp`
    * compile `SegService.java`並放在`service/impl`
    * compile `SegServiceImpl.java`並放在`service/impl`
    * compile `SegServicePublisher.java`並放在`service/endp`
5. 確定你有安裝Java SDK 8，然後執行`run.sh`，這樣service就啟動了。當第一次呼叫service時，會載入資料，所以會花較長時間。


## Usage

1. 在Python中安裝`suds`套件
    * 在Python2可以用`pip install suds`
    * 在Python3可以用`pip3 install suds-py3`
2. 建立一個SOAP Client，就可以使用Stanford segmenter了
    * `from suds.client import Client`
    * `segClient = Client('http://localhost:9999/seg?wsdl')`
    * `segClient.service.getSegmentResult(text)`
3. 特別注意，Stanford segmenter的訓練資料是簡體，所以使用繁體時斷詞效果會較差，建議將文字轉為簡體再斷詞
