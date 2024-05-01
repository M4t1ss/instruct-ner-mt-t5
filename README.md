# instruction-ner-mt-t5
Fine-tuning T5 with instructions for named entity recognition and entity-aware machine translation

 * Use scripts in the `data-processing` directory to prepare training, development and evaluation data
   * `add-tags.sh` adds instruction tags to data
   * `count-tags.sh` counts all named entity (NE) tags in a file
   * `remove-non-matching-tags.php` removes tags from parallel files for machine translation where the source side tags do not match the target side
   * `remove-tags.sh` removes all NE tags
   * `spm-encode.sh` trains a sentencepiece model
   * `tag-entities.py` adds NE tags to an input file using Spacy
 * Use `run.sh` to launch fine-tuning using deepspeed
 * `t5-generate.py` can be used to generate output with a trained/fine-tuned model