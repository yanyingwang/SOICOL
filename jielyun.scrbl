#lang scribble/manual

@(require (file "styles/hj.js.rkt"))
@js/highlight-jumping


@title[#:tag "jielun"]{结论}

@section{总结}
本论文通过分析Lisp的哲学思想、S-表达式的语法、不同数据结构间的形
式演变关系以及通俗函数库，进而明确了Lisp编程语言的优缺点，更进而的，
结合中文汉字的优势，尝试塑造了一种基于Lisp编程语言的汉语编程语言。最
终选用Racket编程语言作为实现平台，进行了实践。

从实践结果来看，所实现的汉语编程语言具有英文所不能企及的优点，大体
列举如下：
@itemlist[
@item{数据结构间的演变关系通过汉语汉字来表达；}
@item{函数名通过汉字的偏旁和汉语词语的规则来完成函数入参、出参的类型}
@item{指示；}
@item{语法简单且可扩展性强，可以兼容原有函数库。}
]

@section{展望}
当今世界，计算机行业的编程语言已经历经了近百年的发展，已经从结构化
面向过程的编程比如C过渡到了面向对象的编程比如C++、Java、Python和
Ruby等，而今函数式编程崭露头角。

借助函数式编程语言的特性和Lisp编程语言的S-表达式和其方言Scheme的
极简主义设计哲学，可以轻松的完成已有英文函数库的汉化，并且兼有引入
汉语命名后的本论文所探索提出的上述优势，这为汉语编程的继承已有编程语
言的成果积累（比如函数库等）提供了可能性，为汉语编程指明了方向和可行
的道路。


名语言在新时代和新环境下进行了探索，关注中文的独特特性。
同时，汉语编程语言并非只是对现有技术的简单重复，而是具有其独有的价值。
相反，如果能够充分发挥汉语和汉字的特点，汉语编程语言或许能展现出其独特的优势。