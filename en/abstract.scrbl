#lang scribble/manual

@title[#:tag "abstract"]{Abstract}

Lisp is a family of computer programming languages with a long history. It is widely known for its distinctive prefix notation and syntax, as well as for its various internal data structures that evolved from linked lists. Lisp continues to occupy an important place in the field of computer programming languages, particularly in Western countries.

From a formal perspective, one of Lisp's most distinctive features is its S-expression syntax, whose rules are remarkably simple. When Lisp is hosted in English, the simplicity of English as a natural language further contributes to the limited expressive capacity of the language at the semantic level.

However, hosting Lisp in Chinese opens up considerable possibilities for enhancing its semantic expressiveness while preserving the S-expression syntax. This is due to the flexibility of Chinese grammar and the rich variety of Chinese characters.

Based on these ideas, this paper proposes a feasibility-oriented implementation approach for a Chinese programming language built on Lisp syntax and data structures. Taking advantage of characteristics that distinguish Chinese characters and the Chinese language from Latin letters and English—including greater grammatical flexibility, conciseness, and high information density—this work explores practical engineering approaches to developing a programming language that combines distinctive Chinese features with Lisp syntax to achieve greater readability and usability. A preliminary implementation was ultimately developed in Racket, a Lisp dialect.

@bold{Keywords}: programming languages, Lisp, S-expressions, Chinese, Chinese characters, character formation
