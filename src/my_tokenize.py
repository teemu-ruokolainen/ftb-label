#!/usr/bin/env python
"""
Read sys.stdin, tokenize, and write the output to sys.stdout
"""
import sys
import nltk
from nltk.tokenize import TweetTokenizer

def tokenize(file):
    """
    Tokenize text
    """
    nltk.download('punkt', quiet=True)
    sent_detector = nltk.data.load('tokenizers/punkt/finnish.pickle')
    tknzr = TweetTokenizer()
    for line in file:
        sentences = sent_detector.tokenize(line)
        for sentence in sentences:
            wordforms = tknzr.tokenize(sentence)
            print('{}\n'.format('\n'.join(wordforms)))


if __name__=='__main__':
    tokenize(sys.stdin)
