---
layout: page
title:  "Pronoun resolution"
categories: jekyll update
---

# Pronoun Resolution

## Abstract

Natural Language Processing is the branch of

Artificial Intelligence which deals with teach-
ing computers how to process and analyze

large amounts of natural language data. Many

researchers are taking part in NLP for perform-
ing the complex task such as Speech Recogni-
tion, Natural language Understanding and Nat-
ural Language Generation by the computers.

One of the tasks which we can use is pronoun
Resolution.
In the Pronoun Resolution task, the machine
has to tell the pronoun based on the context
used in the previous sentences. Pronouns are
difficult for the machines to find as they are not
having the knowledge about the context of the
previous sentences. Various models are built
to perform these tasks such as BERT. Models
such as Spacy are useful for detecting the noun
phrases and to replace the correct pronoun in
the sentences based on nouns. Keywords: Bert,
spanBert, multiple choice, project Gutenberg,
swag dataset, winogrande dataset

## Introduction
Pronoun resolution also known as Anaphora Res-
olution is the problem in which the pronouns are

resolved based on their references used in the ear-
lier sentences as noun phrases. For humans, this

ability is natural as we have the contextual knowl-
edge about the sentences before. We hear a sen-
tence with a pronoun that could be referring to two

nouns, and we use our common sense and general
knowledge to resolve the ambiguity. In the field of
natural language processing, a lot of researches are
going on to train the models to figure out the correct pronoun. For solving this ambiguity, we

need to train machines with a data set where the sen-
tences with ambiguity in the pronouns are present

along with their correct reference. The computer
learns this and then can correctly decipher new data.

This method of teaching the machines through ex-
amples is also known as Supervised Learning. For

performing this project, initially we performed the
preprocessing of data which we get in the text
form. We fathered most of our text from the Project

Gutenberg site in the form of the stories. After pre-
processing we created the dataset of more than 1

lac datapoints. The BERT model is then fine tuned
using the Hugging transformers and the model is
trained using the data points created. The trained

model is used for testing the test dataset Wino-
Grande.

## Problem Statement
The aim of this project is to guess the correct
pronoun by the machine based on the contextual

knowledge present in the previous related sen-
tences. For this, we consider sentences that have

two annotated subjects that could both be referred
to by a single annotated pronoun.
The goal is to correctly decide which of the two
subjects the pronoun is referring to.

This is a classification problem where the fea-
tures are:

• Part 1 of the sentence containing the first sub-
ject

• Part 2 containing the second subject
• Pronoun

The label is the correct option out of the two
options given(subject 1/2).

## Related Work
The current state of the art model has an average F1
score of 80.2% for coreference resolution is from

the paper titled “Revealing the Myth of Higher-
Order Inference in Coreference Resolution ” in

2020 by Liyan Xu, Jinho D. Choi [1]. Two papers
from 2019 have used bert and spanBert by joshi et
al [2] respectively and achieved a score of 79.6 and

76.9. Entity Equalization, Bert, spanBert, deep con-
textual embeddings[6], End to end learning [4][7],

higher order inference[5] etc are the techniques that
have been most used in top scoring methods over
the years.

## Datasets
We have used multiple datasets such as Balacopa
dev, GAP and data from the site project Gutenberg.
GAP and Balacopa-dev are specifically made for
the purpose of the pronoun resolution while the site
Gutenberg consists of the story books as the text
files.
All the data was copied into a single text file for
further processing. The combined number of lines
for all the data collected has exceeded 100,000, but
due to computational limits, we have removed over
half of the data.
We specifically included the data in the form
of the story from that site because it has a high
chance of having consecutive sentences with the
same noun phrases.

## System Architecture and Algorithms
As shown in Figure 1, we have used the hugging
transformer’s multiple-choice QuestionAnswering
code to finetune the BERT model. For this, we
converted all our data into a format that is required
by the BERT model. This will be divided into
two parts at 7:3 ratio, and are called training and
validation datasets.

To do this, we first collect all the project Guten-
Berg data into a data text.txt file. We then pre-
process this file and remove all the black spaces.

We also remove un-necessary symbols and only
retain alpha numeric characters along with “.” and
“.” symbols.

![pronoun resolution flow](pronoun_resolution_flow.jpg)

Then we convert the model into an xml format
where the root is at the top of the hierarchy. There
are a lot of ¡item¿ tags under root and each item has
a ¡p¿, ¡a1¿ and ¡a2¿ tagged sentences. We basically
select three sentences each from the text file and
convert them into this format.
Then whenever we find two sentences having
the same noun, we replace one of them with a “ ”
symbol. Then we split the sentence into two parts
based on the sentence. The entire sentence will
be startphrase, the left part of the symbol will be
sentence1, the right part of the sentence will be
sentence 2 and the two nouns will become ending0
and ending1. The noun we are replacing will decide
the label. The ending2 and ending3 are left blank
since we have only two options.
Then to test the finetuned model, we use the

WinoGrande dataset, which is also not in the re-
quired format. So, we convert it to the same format

as training and validation data.
The converted GutenBerg dataset is split into
train and validation datasets and the converted
WinoGrande dataset will become the test dataset.
Finally we uploaded the dataset to Collab and used
the GPU runtime to finetune the multiple choice
model. This training ended with the accuracy of
the test dataset being displayed.

## Evaluations
We evaluated our results on the WinoGrande
dataset. This dataset is of size 5466, and we are

able to achieve an accuracy of 69.4% using a maxi-
mum sequence length of 80.

Upon changing the learning rate to 5 e-4, se-
quence length to 200 and batch sizes to 16, the

accuracy has dropped significantly to 30%.
We performed the operations on our systems
with the limited resources and we are getting the
Cuda memory out error for sequences of size 400

and collab crashed for bigger datasets. As our train-
ing dataset is limited due to the limitations of our

hardware configurations, the accuracy might in-
crease with a better system.

## Conclusion

After creating a synthetic dataset using the data
collected from project gutenberg, we were able to
finetune the BERT model for multiple choice and
achieved an accuracy of 69.4%.
We might be able to get better accuracy with

bigger datasets and better memory and gpu con-
figurations as it will allow us to experiment with

larger sequence sizes and batch sizes.

We could also improve our accuracy by improv-
ing the quality of our dataset.

## References
1. Liyan Xu, Jinho D. Choi. (2020). Reveal-
ing the Myth of Higher-Order Inference in

Coreference Resolution.
2. Mandar Joshi, Omer Levy, Daniel S. Weld,

Luke Zettlemoyer. (2019). BERT for Corefer-
ence Resolution: Baselines and Analysis.

3. Kantor, A. (2019). Coreference Resolution
with Entity Equalization. In Proceedings of
the 57th Annual Meeting of the Association
for Computational Linguistics (pp. 673–677).
Association for Computational Linguistics.

4. Fei, P. (2019). End-to-end Deep Reinforce-
ment Learning Based Coreference Resolution.

In Proceedings of the 57th Annual Meeting

of the Association for Computational Linguis-
tics (pp. 660–665). Association for Computa-
tional Linguistics.

5. Lee, L. (2018). Higher-Order Coreference
Resolution with Coarse-to-Fine Inference. In
Proceedings of the 2018 Conference of the
North American Chapter of the Association

for Computational Linguistics: Human Lan-
guage Technologies, Volume 2 (Short Papers)

(pp. 687–692). Association for Computa-
tional Linguistics.

6. Matthew E. Peters, Mark Neumann, Mohit

Iyyer, Matt Gardner, Christopher Clark, Ken-
ton Lee, Luke Zettlemoyer. (2018). Deep

contextualized word representations.
7. Kenton Lee, Luheng He, Mike Lewis, Luke
Zettlemoyer. (2017). End-to-end Neural
Coreference Resolution.
8. Project Gutenberg. 2020. Project
Gutenberg. [online] Available at:
¡https://www.gutenberg.org/¿ [Accessed 25
November 2020].https://www.gutenberg.org/
