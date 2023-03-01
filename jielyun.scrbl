#lang scribble/manual


@title[#:tag "jielun"]{结论}

@section{总结}
本论文通过分析 Lisp 的哲学思想、S-表达式的语法、不同数据结构间的形
式演变关系以及通俗函数库，进而明确了 Lisp 编程语言的优缺点，更进而的，
结合中文汉字的优势，尝试塑造了一种基于 Lisp 编程语言的汉语编程语言。最
终选用 Racket 编程语言作为实现平台，进行了实践。

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
面向过程的编程比如 C 过渡到了面向对象的编程比如 C++、Java、Python 和
Ruby 等，而今函数式编程崭露头角。

借助函数式编程语言的特性和 Lisp 编程语言的 S-表达式和其方言 Scheme
的极简主义设计哲学，可以轻松的完成已有英文函数库的汉化，并且兼有引入
汉语命名后的本论文所探索提出的上述优势，这为汉语编程的继承已有编程语
言的成果积累（比如函数库等）提供了可能性，为汉语编程指明了方向和可行
的道路。

名语言放眼新时代新环境，探索证明了汉语是博大精深、兼容并包的，而汉
语编程语言也并非如很多人所想是“重复的造轮子”、“并无大用”。相反，
编程语言如果充分利用汉语汉字的一些独有特性，可以发挥出英文所不能企及
的威力的。广阔天地，尤待探索。