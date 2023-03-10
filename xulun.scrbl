#lang scribble/manual

@(require (file "styles/hj.js.rkt"))
@js/highlight-jumping

@title[#:tag "xulun"]{绪论}

@section{动机}
中国是一个拥有五千年灿烂文化的文明古国，其四大发明造纸术、指南
针、火药及印刷术深刻的改变了人类世界。然而在中国近代史中，从鸦片战争
开始，中国就饱受西方资本主义国家殖民化的摧残，究其原因是西方国家的在
近代经历了一系列的工业革命。

从18世纪60年代英国人瓦特发明蒸汽机开始的第一次工业革命，到19世
纪60年代后期发生的以电力和石油的应用为标志的第二次工业革命，进而到
20世纪四五十年代开始的以信息化数字化为代表的第三次工业革命，西方国家
在科学技术上遥遥领先着中国。

中国自诩文明古国，然而中国人的文化自信在中国的近代史中，从清王朝的
鸦片战争战败到继而之后的一系列的割地赔款，再到甲午战争，八国联军侵华
火烧圆明园，七七事变日本侵华到南京大屠杀，几乎消亡殆尽。然而，历经沧
桑的古中国终于迎来的全新时刻，在1949年以西方的马列主义为主旨成立了新
中国。然而不久，同样以马列主义建立联盟的苏联在1991年轰然倒下，解体为
若干资本主义国家。新中国在邓小平的领导下进行了改革开放进行着中国特色
的社会主义的探索之路，励精图治，经过几代人的努力，勤劳勇敢的中国人在
新时代习总书记的领导下，人民生活安康幸福，朝着建设社会主义强国，为实
现中华民族的伟大复兴而奋斗不至着。

步入21世纪，世界格局变换莫测，风起云涌。2018年，时任美国总统特朗
普针对中国发起贸易战、科技战。不管是从现今世界发展的时局来看，还是从
中国自身发展的内部格局来看，中国都俨然需要在一系列的尖端领域进行自主
探索。

放眼中国，中国现今在科学技术领域与美国依旧相去深远。着眼软件领域，
中国在信息技术的底层建设上，不管是硬件还是软件，都没有太多自主的创
造。单就软件而言，软件的基础无疑是编程语言，现今主流的编程语言几乎都
来自于美国，并且人机交互的接口是依托在英语之上的。

当下，计算机已经经历了几十年的高速发展，所有的基础建设都已经基于英
文成型，并且日积月累形成的各种各样基于英文的编程语言、函数库乃至各种
网络协议、操作系统，进而到当下的学术环境的前沿领域都被英语所主导了。

@section{目的}
试问，在这种全国上下已经形成自主探索共识的背景下，如果中国要在编程
语言上的实现，人机交互的编程接口，难道是要建立在自然语言英语之上的
吗？

中文相较英文，是否真的不适合进行编程语言人机交互接口的实践呢？还是
说这是当代国人在几百年的技术落后下的一种文化失信的错觉呢？
在当下的环境下，是否能推出一种汉语编程语言乃至将其推广到流行呢？较
英语而言，汉语编程语言又能具备怎样的优势、为编程语言带来怎样的活力
呢？

本论文即是要探讨以上问题。