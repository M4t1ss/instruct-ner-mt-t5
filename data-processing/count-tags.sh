#!/bin/bash

FILE=$1



COUNT=`grep $FILE -e '<CARDINAL>' | wc -l`
echo '<CARDINAL>' $COUNT 

COUNT=`grep $FILE -e '<DATE>' | wc -l`
echo '<DATE>' $COUNT 

COUNT=`grep $FILE -e '<EVENT>' | wc -l`
echo '<EVENT>' $COUNT 

COUNT=`grep $FILE -e '<FAC>' | wc -l`
echo '<FAC>' $COUNT 

COUNT=`grep $FILE -e '<GPE>' | wc -l`
echo '<GPE>' $COUNT 

COUNT=`grep $FILE -e '<LANGUAGE>' | wc -l`
echo '<LANGUAGE>' $COUNT 

COUNT=`grep $FILE -e '<LAW>' | wc -l`
echo '<LAW>' $COUNT 

COUNT=`grep $FILE -e '<LOC>' | wc -l`
echo '<LOC>' $COUNT 

COUNT=`grep $FILE -e '<MONEY>' | wc -l`
echo '<MONEY>' $COUNT 

COUNT=`grep $FILE -e '<NORP>' | wc -l`
echo '<NORP>' $COUNT 

COUNT=`grep $FILE -e '<ORDINAL>' | wc -l`
echo '<ORDINAL>' $COUNT 

COUNT=`grep $FILE -e '<ORG>' | wc -l`
echo '<ORG>' $COUNT 

COUNT=`grep $FILE -e '<PERCENT>' | wc -l`
echo '<PERCENT>' $COUNT 

COUNT=`grep $FILE -e '<PERSON>' | wc -l`
echo '<PERSON>' $COUNT 

COUNT=`grep $FILE -e '<PER>' | wc -l`
echo '<PER>' $COUNT 

COUNT=`grep $FILE -e '<PRODUCT>' | wc -l`
echo '<PRODUCT>' $COUNT 

COUNT=`grep $FILE -e '<QUANTITY>' | wc -l`
echo '<QUANTITY>' $COUNT 

COUNT=`grep $FILE -e '<WORK_OF_ART>' | wc -l`
echo '<WORK_OF_ART>' $COUNT 

COUNT=`grep $FILE -e '<MISC>' | wc -l`
echo '<MISC>' $COUNT 

COUNT=`grep $FILE -e '<TIME>' | wc -l`
echo '<TIME>' $COUNT 