import spacy
import sys

language = sys.argv[1]

if language == "de":
    NER = spacy.load("de_core_news_lg")
elif language == "en":
    NER = spacy.load("en_core_web_trf")
elif language == "ja":
    NER = spacy.load("ja_core_news_trf")



def tag_entities(input_text):

    text = NER(input_text)

    entities = []
    output = input_text

    for ent in text.ents:
        entities.append({"start":ent.start_char, "end":ent.end_char, "label":ent.label_})

    entities.reverse()
    ignore = ['MOVEMENT','PET_NAME','PHONE','TITLE_AFFIX']

    for entity in entities:
        if entity["label"] not in ignore:
            output = output[:entity["end"]] + "</" + entity["label"] + ">" + output[entity["end"]:]
            output = output[:entity["start"]] + "<" + entity["label"] + ">" + output[entity["start"]:]

    return output


for line in sys.stdin:
    sys.stdout.write(tag_entities(line))