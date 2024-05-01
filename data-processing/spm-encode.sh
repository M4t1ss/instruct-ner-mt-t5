#!/bin/bash

spm_train --character_coverage 0.9995 --model_prefix=ende-ner --vocab_size=32000 --num_threads 80 \
	--user_defined_symbols "<LOC>,<ORG>,</LOC>,<PERSON>,</PERSON>,</ORG>" \
	--input=ntrains.ende --shuffle_input_sentence --input_sentence_size 10000000