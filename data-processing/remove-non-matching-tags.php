<?php
error_reporting(E_ALL & ~E_WARNING);

//Input parameters
$source_sentences 	= $argv[1];
$target_sentences	= $argv[2];

//Open files
$inSRC = fopen($source_sentences, "r") or die("Can't open source input file!");
$inTRG = fopen($target_sentences, "r") or die("Can't open target input file!");

$outSRC = fopen($source_sentences.".match", "w") or die("Can't create source output file!");
$outTRG = fopen($target_sentences.".match", "w") or die("Can't create target output file!");

$outSRC_rem = fopen($source_sentences.".nonmatch", "w") or die("Can't create removed source output file!");
$outTRG_rem = fopen($target_sentences.".nonmatch", "w") or die("Can't create removed target output file!");

$i = 0;
$j = 0;

$C1 = "<CARDINAL>";
$C2 = "<DATE>";
$C3 = "<EVENT>";
$C4 = "<FAC>";
$C5 = "<GPE>";
$C6 = "<LANGUAGE>";
$C7 = "<LAW>";
$C8 = "<LOC>";
$C9 = "<MONEY>";
$C10 = "<NORP>";
$C11 = "<ORDINAL>";
$C12 = "<ORG>";
$C13 = "<PERCENT>";
$C14 = "<PERSON>";
$C15 = "<PRODUCT>";
$C16 = "<QUANTITY>";
$C17 = "<WORK_OF_ART>";
$C18 = "<TIME>";
$C1c = "</CARDINAL>";
$C2c = "</DATE>";
$C3c = "</EVENT>";
$C4c = "</FAC>";
$C5c = "</GPE>";
$C6c = "</LANGUAGE>";
$C7c = "</LAW>";
$C8c = "</LOC>";
$C9c = "</MONEY>";
$C10c = "</NORP>";
$C11c = "</ORDINAL>";
$C12c = "</ORG>";
$C13c = "</PERCENT>";
$C14c = "</PERSON>";
$C15c = "</PRODUCT>";
$C16c = "</QUANTITY>";
$C17c = "</WORK_OF_ART>";
$C18c = "</TIME>";


while (($sourceSentence = fgets($inSRC)) !== false && ($targetSentence = fgets($inTRG)) !== false) {

	$sCnt = array();
	$tCnt = array();

	for ($z=1; $z < 19; $z++) { 
		// code...
		${ 'C' . $z . 's'} = substr_count($sourceSentence, ${ 'C' . $z });
		${ 'C' . $z . 't'} = substr_count($targetSentence, ${ 'C' . $z });
	}

	$SUMs = $C1s + $C2s + $C3s + $C4s + $C5s + $C16s + $C7s + $C8s + $C9s + $C10s + $C11s + $C12s + $C13s + $C14s + $C15s + $C16s + $C17s + $C18s;
	$SUMt = $C1t + $C2t + $C3t + $C4t + $C5t + $C16t + $C7t + $C8t + $C9t + $C10t + $C11t + $C12t + $C13t + $C14t + $C15t + $C16t + $C17t + $C18t;

	if( 
		$C1s == $C1t &&
		$C2s == $C2t &&
		$C3s == $C3t &&
		$C4s == $C4t &&
		$C5s == $C5t &&
		$C6s == $C6t &&
		$C7s == $C7t &&
		$C8s == $C8t &&
		$C9s == $C9t &&
		$C10s == $C10t &&
		$C11s == $C11t &&
		$C12s == $C12t &&
		$C13s == $C13t &&
		$C14s == $C14t &&
		$C15s == $C15t &&
		$C16s == $C16t &&
		$C17s == $C17t &&
		$C18s == $C18t
	){
        fwrite($outSRC, $sourceSentence);
        fwrite($outTRG, $targetSentence);
	}else{
        fwrite($outSRC_rem, $sourceSentence);
        fwrite($outTRG_rem, $targetSentence);
		$i++;

		for ($z=1; $z < 19; $z++) {
			if(${ 'C' . $z . 's'} !== ${ 'C' . $z . 't'}){
				$sourceSentence = str_replace(${ 'C' . $z }, "", $sourceSentence);
				$sourceSentence = str_replace(${ 'C' . $z . 'c'}, "", $sourceSentence);
				$targetSentence = str_replace(${ 'C' . $z }, "", $targetSentence);
				$targetSentence = str_replace(${ 'C' . $z . 'c'}, "", $targetSentence);
				$j++;
			}
		}
        fwrite($outSRC, $sourceSentence);
        fwrite($outTRG, $targetSentence);
	}
}

echo "Found ".$i." sentence pairs with a NER tag count mismatch between source and target sentences\n";
echo "Removed ".$j." NER tags in sentence pairs with a NER tag count mismatch between source and target sentences\n";