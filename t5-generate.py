from transformers import (
    AutoTokenizer,
    T5ForConditionalGeneration
)
from datasets import Dataset

import transformers
transformers.utils.logging.set_verbosity_error()

# MODEL = 'google/t5-v1_1-small'
MODEL = 'google/flan-t5-large'
# MODEL = 't5-large'
BATCH_SIZE = 64
MAX_LENGTH = 256 # Maximum context length to consider while preparing dataset.

src = "en"
trg = "de"
device = "cuda"

model = T5ForConditionalGeneration.from_pretrained(MODEL)
tokenizer = AutoTokenizer.from_pretrained(MODEL, model_max_length=MAX_LENGTH)

model.to(device)


data_dir = '/data/wmt23/distill/extracted/ner-mt/for-mt5/devel-parts';
file_src = open(data_dir+'/devel-src.deen-bas-mt.txt', 'r')
# file_src = open(data_dir+'/devel-src.ende-bas-mt.txt', 'r')

lines_src = file_src.readlines()
file_data = {src : lines_src}
test_data = Dataset.from_dict(file_data)



def generate_translation(batch):
    # This is for Marian style models
    
    outputs = model.generate(
        **tokenizer(batch[src], return_tensors="pt", max_length=MAX_LENGTH, padding='max_length', truncation=True).to(device), 
        max_length=MAX_LENGTH
    )
    output_str = tokenizer.batch_decode(outputs, skip_special_tokens=True)

    batch["pred"] = output_str

    return batch


results = test_data.map(generate_translation, batched=True, batch_size=BATCH_SIZE, remove_columns=[src])

pred_str = results["pred"]

for item in pred_str:
    print("".join(item))

