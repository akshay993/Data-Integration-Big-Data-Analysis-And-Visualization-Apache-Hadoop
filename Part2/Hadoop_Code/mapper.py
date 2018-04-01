#!/usr/bin/env python
"""mapper.py"""

import sys
import nltk
nltk.download('stopwords')
nltk.download('punkt')
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize

ps = PorterStemmer()
stop_words=set(stopwords.words("english"))

# input comes from STDIN (standard input)
for line in sys.stdin:
    #line=" hi my name is akshay. He is a good boy. He loves to drive his Porsche  "
    # remove leading and trailing whitespace
    line=line.lower()
    line = line.strip()
    
    #Initializing Word List 
    word_list=[]
    
    
    # split the line into words
    #words = line.split()
    words=word_tokenize(line)
    
    #Remove Stop words from the list of words
    for word in words:
        if word in stop_words or word == '.':
            pass
        else:
            word=ps.stem(word)
            word_list.append(word)
                    
    
    # increase counters
    for word in word_list:
        # write the results to STDOUT (standard output);
        # what we output here will be the input for the
        # Reduce step, i.e. the input for reducer.py
        #
        # tab-delimited; the trivial word count is 1
        print ("%s\t%s" % (word, 1))