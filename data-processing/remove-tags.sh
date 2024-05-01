#!/bin/bash

#English

cat | \
sed 's/<GPE>/<LOC>/g' | \
sed 's/<\/GPE>/<\/LOC>/g' | \

sed 's/<CARDINAL>//g' | \
sed 's/<\/CARDINAL>//g' | \

sed 's/<DATE>//g' | \
sed 's/<\/DATE>//g' | \

sed 's/<EVENT>//g' | \
sed 's/<\/EVENT>//g' | \

sed 's/<FAC>//g' | \
sed 's/<\/FAC>//g' | \

sed 's/<LANGUAGE>//g' | \
sed 's/<\/LANGUAGE>//g' | \

sed 's/<LAW>//g' | \
sed 's/<\/LAW>//g' | \

sed 's/<MONEY>//g' | \
sed 's/<\/MONEY>//g' | \

sed 's/<NORP>//g' | \
sed 's/<\/NORP>//g' | \

sed 's/<ORDINAL>//g' | \
sed 's/<\/ORDINAL>//g' | \

sed 's/<PERCENT>//g' | \
sed 's/<\/PERCENT>//g' | \

sed 's/<PRODUCT>//g' | \
sed 's/<\/PRODUCT>//g' | \

sed 's/<QUANTITY>//g' | \
sed 's/<\/QUANTITY>//g' | \

sed 's/<WORK_OF_ART>//g' | \
sed 's/<\/WORK_OF_ART>//g'

sed 's/<TIME>//g' | \
sed 's/<\/TIME>//g'

#German

# cat | \
# sed 's/<PER>/<PERSON>/g' | \
# sed 's/<\/PER>/<\/PERSON>/g' | \

# sed 's/<MISC>//g' | \
# sed 's/<\/MISC>//g'