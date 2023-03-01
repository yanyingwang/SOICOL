#lang scribble/manual

@title[#:tag "sheji"]{设计}

本章将简要阐述如何把汉语和汉字融入进 Lisp 的 S-表达式的语法中并发挥
出汉字汉语的优势。

@section{基于Racket编程语言而实现的原因}
@subsection{Racket编程语言特性概览}
Racket（原名 PLT Scheme）是个通用、多范型，属于Lisp家族的函数式
程序设计语言，它的设计目之一是为了提供一种用于创造设计与实现其它编程
语言的平台，Racket被用于脚本程序设计、通用程序设计、计算机科学教育和
学术研究等不同领域。

Racket有一个实现平台，包含了执行环境、函数库、即时编译器（JIT
compiler）等等，还有提供一个以Racket本身写成的开发环境DrRacket（原
名 DrScheme）。

Racket平台的发行版本是免费且开放源代码的，以GNU宽通用公共许可
证授权发行，所有由社群所编写的扩展和包都会被上传到PLaneT（一个网页包
发布系统）。

基于Racket实现的Scribble可以用来构建HTML或PDF（依赖
LaTeX），Racket 官方文档就是基于这个语言来编写的。
Racket从8.0的版本开始，将默认的编译和运行系统从Racket BC改为了
Racket CS[13] ，RacketCS基于Chez Scheme编程语言[14][15]的实现，Chez
Scheme是一个由R. Kent Dybvig开发的Scheme实现，Chez Scheme是最
快的可用的Scheme实现之一，于1985年首次发布，在2016年5月13日随
着被思科公司收购而变为开源软件。


@subsection{Racket 编程语言的开发原则}
Racket 的开发基于以下原则：
@itemlist[
@item{编程语言的目的是表述和解决问题，这一过程通常在特定的情境中发
生，该情境有一定的描述语言，因此 Racket 应该是能够创制新编程语
言的编程语言；}
@item{基于上述的表述问题的方式，问题系统可视为多语言的相互联系的组件
的集合，Racket 应当能够提供足够的保护机制，允许实现各种语言的完
26整特性；}
@item{与问题解决相关的在语言之外的机制，如项目和资源的管理，也可被
Racket 转换为语言构造。}
]

@subsection{总结}
总体来说，Racket 的以下特点令其非常适合用于实现汉语编程语言：
@itemlist[
@item{Racket编程语言的设计初衷就是要提供一种用于创造设计与实现其它编
程语言的平台，其势必已经有了丰富的为实现编程语言而所需的各种特
性；}
@item{Racket编程语言已经被广泛的应用于了计算机科学教育和学术研究等领
域，这有利于获取学术领域最新的研究成果并有利于新研究成果的传
播；}
@item{Racket编程语言是Scheme的方言，Scheme是Lisp的方言，Racket
继承并发展了Lisp和Scheme的 S-表达式语法，S-表达式的极简语法
使得新实现不需要关注语法的实现，并给汉语留下了极大的语义层面上
的发挥空间；}
@item{Racket是Scheme语言的实现方言里面函数库最为丰富的实现之一；}
@item{Racket编程语言的文档API是基于其自身而实现的一个称之为
Scribble的编程语言的，这令汉语编程语言的实现文档可以基于
Scribble语言并与原文档做无缝链接跳转。}
]

@section{名语言实现概览}
为叙述方便和代码实现上的方便，上文所述“基于 Lisp 的 S-表达式而实现
的汉语编程语言”我们将在下文统一称之为“名语言”。

“名”有命名之意，即对编程语言里面的抽象概念在自然语言层面上的赋名
化。

@subsection{语法}
因为是基于 Lisp 的 S-表达式而实现的汉语编程语言”S-表达式的极简语法
使得新实现不需要关注语法的实现，并给汉语留下了极大的语义层面上的发挥
空间，所以名语言的语法采用 S-表达式。S-表达式上文各个章节已经有很多叙
述，此处即不再进行赘述。

@subsection{数据结构}
名语言的数据结构可以直接借用 Racket 语言的内部数据结构，Racket 因为用
于学术研究领域的原因，拥有非常多的数据结构，如：Equality、Strings、
Booleans、Characters、Numbers、SymbolsStrings、Byte、Regular Expressions、
Keywords 、Pairs and Lists、Mutable Pairs and Lists、
Vectors、Stencil Vectors、Boxes、Hash Tables、Sequences andStreams、
Dictionaries、Sets、Procedures 等。

这些数据结构互相之间通常都是存在着内在的相互影响或依赖的关系，恰好
可以发挥中文汉字表象、归类、属性指示的特长来表明它们内在存在的关系。

@subsection{基于汉字造字法发展而来的数据结构名}
Racket 语言拥有非常多的数据结构，这些数据结构彼此类似又相互之间存
在着演变关系。比如：

@itemlist[
@item{
pair是一种数据结构，list是基于pair发展而来的数据结构，如果一个
list的末尾也是数据，则它同时是pair又是list；
}
@item{
list如果是一个二维list，则它同时也是association list（类似散列
表）。而目前 Racket 中的英文名并不能明确的反映出这种各个数据结
构之间的演变关系。
}
]

名语言发挥了汉字图形化、抽象化表意的优势而发展了一套更具系统化和结
构化的命名系统。


@subsection{基于汉字造字法和汉语组词规范而发展出的一种轻量级类型指
示方法}

Racket 作为一种动态编程语言，在代码的书写中并无类型指代，虽然已经
有了基于 Racket 语言的扩展类型系统库，称为 Typed Racket。

而名语言是依附于动态编程的，与此同时发挥了汉字造字法的精神和文言文
精简化、浓缩化的优点而引入发展了一套通过函数名暗示输入参数类型和输出
参数类型的方法。

@subsection{翻译程序}
因为语法和数据结构是和 Racket 语言相同的，名语言将会利用 Racket 语
言的内部特性建立一个翻译层程序，将中文命名转译为 Racket 语言。

又因为 Racket 语言拥有非常良好的模块关系，名语言可以针对 Racket 语
言的标准库、扩展库来进行中英文的翻译映射。

另又因 Racket 语言的函数编程特性，翻译可以被轻松的作为扩展库而被重
新引入进 Racket 语言并被使用。

@subsection{文档程序}
因为翻译程序的设计，名语言内部必然是存在一个个中英文映射表的，又因
Racket 语言的编写文档所基于的 Scribble 语言本质上是一个 Racket 语言的
库，因此名语言可以基于 Scribble 语言实现并和 Racket 语言的官方文档进行
无缝衔接跳转，以利于名语言文档的查看和溯源。

@subsection{扩展库}
因为 Racket 语言实质上是 Scheme 语言的方言，Scheme 遵从一种极简哲
31学，所有的代码可以回归到最基础的几个函数定义上，这为名语言的汉化提供
了极大便利：
@itemlist[
@item{
在不完全汉化的前提下，名语言可以作为函数库被引入 Racket 部分的
使用；
}
@item{
在不完全汉化的前提下，可以基于名语言来写自身的扩展库，只要扩展
库所使用的 Racket 库是已经汉化了的；
}
@item{
Racket 遵从 Scheme 的极间原则，此原则为将来名语言在底层上摆脱
Racket 甚至 Scheme 提供了条件：当名语言完成 Racket 和 Scheme 编
程语言全部的编程概念本地化后，条件即成熟。
}
]
