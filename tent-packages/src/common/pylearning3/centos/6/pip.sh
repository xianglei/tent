#!/bin/sh

sudo ./pip3 install requests six numpy h5py cython
sudo ./pip3 install git+https://github.com/clips/pattern@development#egg=pattern
sudo ./pip3 install aerospike amqp apscheduler automl avro awscli beautifulsoup4 bigml cassandra-driver celery opencv-python cx_oracle \
 elasticsearch fabric freeze graphviz gensim Geohash gevent greenlet python-gssapi gym hbase-thrift hive-thrift-py jieba kafka kazoo keras kerberos \
 kombu log4python matplotlib mrjob networkx nltk pandas pandas2sklearn pandas-oracle paramiko parquet pika protobuf py4j python-geohash \
 pyaml python-crfsuite pyinstaller pymongo pymssql pymysql pyspark python-cassandra python-crfsuite python-memcached python-snappy redis \
 django flask scipy seaborn simplejson sklearn sklearn-crfsuite sklearn-pandas snownlp spark-sklearn statsmodels tabulate teradata theano \
 thrift thriftpy tornado tqdm xgboost==0.4a30 opencv-contrib-python pyspark-hbase XlsxWriter PyStemmer python-lzo lzo-indexer scrapy virtualenv
sudo ./pip3 install http://download.pytorch.org/whl/cpu/torch-0.3.1-cp36-cp36m-linux_x86_64.whl
sudo ./pip3 install torchvision
sudo ./pip3 install word2vec