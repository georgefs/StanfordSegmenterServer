# Stanford Segmenter Server

## Introduction

斷詞是中文自然語言處理中的重要步驟，如果你也是用Python，一般中文斷詞最常見的就是結巴斷詞，有時候也會自己收集詞組作斷詞。有一個先進的斷詞器很少人使用，那就是Stanford segmenter。

Stanford segmenter很少人用，是因為它是用Java寫成的，執行時需要花5秒載入資料。如果像我一樣寫Python的人，雖然可以寫一個介面去呼叫，但每次斷詞都要花5秒載入資料，太浪費時間了。所以最好的方法就是將它改寫成一個SOAP service，然後透過Python呼叫。

因為我的Java能力十分不專業，所以安裝過程可能有許多不合理的地方，請見諒。

Stadford segmenter的演算法論文可以參考: [Pi-Chuan Chang, Michel Galley and Chris Manning. 2008. Optimizing Chinese Word Segmentation for Machine Translation Performance](http://nlp.stanford.edu/pubs/acl-wmt08-cws.pdf)。


## Installation

```shell-script
git clone https://github.com/banyh/StanfordSegmenterServer
cd StanfordSegmenterServer
sh install.sh
```

確定你有安裝Java SDK 8，然後執行`run.sh`，這樣service就啟動了。當第一次呼叫service時，會載入資料，所以會花較長時間。


## Customization

1. POS tagger使用的語言model定義在`SegServiceImpl.java`第24行，預設值為`models/chinese-distsim.tagger`代表中文POS tagger
2. Port number定義在`SegServicePublisher.java`第10行，預設值為`http://localhost:9999/seg`


## Usage

1. 在Python中安裝`suds`套件
    * 在Python2可以用`pip install suds`
    * 在Python3可以用`pip3 install suds-py3`
2. 建立一個SOAP Client，就可以使用Stanford segmenter了
    * `from suds.client import Client`
    * `segClient = Client('http://localhost:9999/seg?wsdl')`
    * `segClient.service.getSegmentResult(text)`
3. 注意事項
    * Stanford segmenter的訓練資料是簡體，所以使用繁體時斷詞效果會較差，建議將文字轉為簡體再斷詞
