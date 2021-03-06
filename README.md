# Building a Docker image for ftb-label

This repository contains scripts to build a local Docker image for the ftb-label tagger of [FinnPos](https://github.com/mpsilfve/FinnPos), a morphological tagging and lemmatization tool for Finnish. To build the image, run:

```
$ git clone https://github.com/teemu-ruokolainen/ftb-label.git
$ cd ftb-label
$ docker build --tag your_preferred_image_name .
```

The resulting image has been published in the [Docker Hub](https://hub.docker.com/) where Docker can find it automatically.

To predict morphological tags and lemmas for running Finnish tex, run:
```
$ echo "Tämä on hyvä esimerkkilause!" | docker run -i teemuruokolainen/ftb-label:latest
```

The output looks like this:

>Tämä	_	tämä	[POS=PRONOUN]|[SUBCAT=DEMONSTRATIVE]|[NUM=SG]|[CASE=NOM]	_ \
>on	_	olla	[POS=VERB]|[VOICE=ACT]|[MOOD=INDV]|[TENSE=PRESENT]|[PERS=SG3]	_ \
>esimerkkilause	_	esimerkkilause	[POS=NOUN]|[NUM=SG]|[CASE=NOM]	_ \
>!	_	!	[POS=PUNCTUATION]	_ \

To predict morphological tags and lemmas for already tokenized Finnish text, run:
```
$ echo "Huomasitko , että tämä teksti on jo tokenisoitu ?" | docker run -i teemuruokolainen/ftb-label:latest notokenize
```

To predict morphological tags and lemmas for collections of texts (e.g. sentences or documents), run:
```
$ cat text-file.txt | docker run -i teemuruokolainen/ftb-label:latest
```
where `text-file.txt` should contain one text per row.
