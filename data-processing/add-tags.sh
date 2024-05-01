#!/bin/bash

cat ../train.for-deen.ner.spm.de | spm_decode --model=../deen-ner.model | awk '{print "entity translate German to English:", $0}' > processing/file.1.src
cat ../train.for-deen.ner.spm.en | spm_decode --model=../deen-ner.model | ./untag.sh > processing/file.1.trg
cat ../train.for-ende.ner.spm.en | spm_decode --model=../ende-ner.model | awk '{print "entity translate English to German:", $0}' > processing/file.2.src
cat ../train.for-ende.ner.spm.de | spm_decode --model=../ende-ner.model | ./untag.sh > processing/file.2.trg

cat ../train.for-deen.ner.spm.en | spm_decode --model=../deen-ner.model | awk '{print "recognize English named entities:", $0}' | ./untag.sh > processing/file.5.src 
spm_decode --model=../deen-ner.model < ../train.for-deen.ner.spm.en > processing/file.5.trg
cat ../train.for-ende.ner.spm.de | spm_decode --model=../ende-ner.model | awk '{print "recognize German named entities:", $0}' | ./untag.sh > processing/file.6.src 
spm_decode --model=../ende-ner.model < ../train.for-ende.ner.spm.de > processing/file.6.trg

cp processing/file.1.trg processing/file.9.trg
cp processing/file.2.trg processing/file.10.trg
cat ../train.for-deen.ner.spm.de | spm_decode --model=../deen-ner.model | awk '{print "translate German to English:", $0}' | ./untag.sh > processing/file.9.src
cat ../train.for-ende.ner.spm.en | spm_decode --model=../ende-ner.model | awk '{print "translate English to German:", $0}' | ./untag.sh > processing/file.10.src

cat ../train.for-deen.ner.spm.de | spm_decode --model=../deen-ner.model | awk '{print "recognize German named entities:", $0}' | ./untag.sh > processing/file.13.src
spm_decode --model=../deen-ner.model < ../train.for-deen.ner.spm.de > processing/file.13.trg
cat ../train.for-ende.ner.spm.en | spm_decode --model=../ende-ner.model | awk '{print "recognize English named entities:", $0}' | ./untag.sh > processing/file.14.src
spm_decode --model=../ende-ner.model < ../train.for-ende.ner.spm.en > processing/file.14.trg


TYPE=ent-mt

cat \
	processing/file.15.src \
	processing/file.16.src \
	processing/file.17.src \
	> $TYPE-train.src

cat \
	processing/file.15.trg \
	processing/file.16.trg \
	processing/file.17.trg \
	> $TYPE-train.trg

~/scripts/shuffle_parallel.sh $TYPE-train.src $TYPE-train.trg

# head -n 1000000 $TYPE-train.src.shuf > 1m-$TYPE-train.src
# head -n 1000000 $TYPE-train.trg.shuf > 1m-$TYPE-train.trg

head -n 100000 $TYPE-train.src.shuf > 100k-$TYPE-train.src
head -n 100000 $TYPE-train.trg.shuf > 100k-$TYPE-train.trg

# head -n 10000000 processing/$TYPE-train.src.shuf > 10m-$TYPE-train.src
# head -n 10000000 processing/$TYPE-train.trg.shuf > 10m-$TYPE-train.trg

mv *.shuf processing/

cat \
	processing/file.1.src \
	processing/file.2.src \
	processing/file.5.src \
	processing/file.6.src \
	processing/file.9.src \
	processing/file.10.src \
	processing/file.13.src \
	processing/file.14.src \
	> train.src

cat \
	processing/file.1.trg \
	processing/file.2.trg \
	processing/file.5.trg \
	processing/file.6.trg \
	processing/file.9.trg \
	processing/file.10.trg \
	processing/file.13.trg \
	processing/file.14.trg \
	> train.trg

~/scripts/shuffle_parallel.sh train.src train.trg
