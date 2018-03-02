#!/bin/sh

sudo ./pip3 install requests six numpy h5py cython
sudo ./pip3 install git+https://github.com/clips/pattern@development#egg=pattern
sudo ./pip3 install automl
sudo ./pip3 install beautifulsoup4
sudo ./pip3 install bigml
sudo ./pip3 install opencv-python
sudo ./pip3 install graphviz
sudo ./pip3 install gensim
sudo ./pip3 install Geohash
sudo ./pip3 install gym
sudo ./pip3 install jieba
sudo ./pip3 install keras
sudo ./pip3 install matplotlib
sudo ./pip3 install networkx
sudo ./pip3 install nltk
sudo ./pip3 install pandas
sudo ./pip3 install pandas2sklearn
sudo ./pip3 install python-geohash
sudo ./pip3 install python-crfsuite
sudo ./pip3 install pyspark
sudo ./pip3 install scipy
sudo ./pip3 install seaborn
sudo ./pip3 install sklearn
sudo ./pip3 install sklearn-crfsuite
sudo ./pip3 install sklearn-pandas
sudo ./pip3 install snownlp
sudo ./pip3 install spark-sklearn
sudo ./pip3 install statsmodels
sudo ./pip3 install theano
sudo ./pip3 install xgboost==0.4a30
sudo ./pip3 install opencv-contrib-python
sudo ./pip3 install pyspark-hbase
sudo ./pip3 install tensorflow
sudo ./pip3 install mxnet
sudo ./pip3 install tensorboard
sudo ./pip3 install scrapy virtualenv aerospike amqp apscheduler avro awscli cassandra-driver celery cx_oracle \
 easybase elasticsearch fabric freeze gevent greenlet python-gssapi hbase-thrift hive-thrift-py kafka kazoo kerberos \
 kombu log4python mrjob pandas-oracle paramiko parquet pattern pika protobuf py4j python-geohash \
 pyaccumulo pyaml python-crfsuite pyinstaller pymongo pymssql pymysql pyspark python-cassandra python-crfsuite python-memcached python-snappy redis \
 django==1.11 flask scipy seaborn simplejson sklearn sklearn-crfsuite sklearn-pandas snownlp spark-sklearn statsmodels tabulate teradata theano \
 thrift thriftpy tornado tqdm XlsxWriter PyStemmer python-lzo lzo-indexer
sudo ./pip install http://download.pytorch.org/whl/cpu/torch-0.3.1-cp27-cp27m-linux_x86_64.whl
sudo ./pip install torchvision
sudo ./pip install word2vec fasttext lightgbm future futures