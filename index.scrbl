#lang scribble/manual


@title[#:style '(toc)]{SOICOL}
@author[(author+email (hyperlink "https://yanying.wang" "Yanying Wang") "yanyingwang1@gmail.com")]


@; @defmodule[soicaiol]
Significance Of Imposing Chinese On Lisp @linebreak{}
中文对于Lisp编程语言的意义

@(table-of-contents)
@include-section["qianyan.scrbl"]
@include-section["zhaiyao.scrbl"]
@include-section["xulun.scrbl"]
@include-section["fenxi.scrbl"]
@include-section["shixian.scrbl"]
@include-section["jielyun.scrbl"]

@index-section[]

@(bibliography
  (bib-entry #:key "liyingzi18"
             #:author "李英姿"
             #:title "白话文运动：一次自下而上的语言规划"
             #:date "2018-07-29(12)"
             #:location "光明日报"
             #:url "https://epaper.gmw.cn/gmrb/html/2018-07/29/nw.D110000gmrb_20180729_3-12.htm")

  (bib-entry #:key "mayixin96"
             #:author "马以鑫"
             #:title "白话文运动历史轨迹的重新考察"
             #:date "1996-08(K3)"
             #:location "华东师范大学学报：哲社版"
             #:url "http://rdbk1.ynlib.cn:6251/qw/Paper/43965")

  (bib-entry #:key "jiaoyubu11"
             #:author "教育部（语言）"
             #:title "标点符号用法/General rules for punctuation"
             #:date "2011-12-30"
             #:location "中国国家标准化管理委员会"
             #:url "https://openstd.samr.gov.cn/bzgk/gb/newGbInfo?hcno=22EA6D162E4110E752259661E1A0D0A8"
             #:note "GB/T 15834-2011")

  (bib-entry #:key "supeicheng13"
             #:author "苏培成"
             #:title "近百年来汉字的简化与规范"
             #:date "2013-08-27"
             #:url "http://www.moe.gov.cn/jyb_xwfb/xw_fbh/moe_2069/s7135/s7562/s7569/201308/t20130827_156355.html")

  (bib-entry #:key "leibniz46"
             #:author "Gottfried Wilhelm Leibniz"
             #:title "《论只使用符号0和1的二进制算术，兼论其用途及它赋予伏羲所使用的古老图形的意义》（Explication de l'arithmétique binaire, qui se sert des seuls caractères 0 et 1 avec des remarques sur son utilité et sur ce qu'elle donne le sens des anciennes figures chinoises de Fohy）"
             #:date "1646-7-1－1716-11-14"
             #:url "https://books.google.com/books/about/Leibniz_Korrespondiert_mit_China.html?id=CuvWAAAAMAAJ")

  (bib-entry #:key "yangzhenning93"
             #:author "杨振宁(Yang Chen-ning)"
             #:title "近代科学进入中国的回顾与前瞻(LOOKING BACK ON AND FORWARD TO THE ENTRANCE OF MODERN SCIENCE INTO CHINA)"
             #:date "1993-4-27"
             #:url "https://www.nsfc.gov.cn/csc/20345/20348/pdf/1994/%E8%BF%91%E4%BB%A3%E7%A7%91%E5%AD%A6%E8%BF%9B%E5%85%A5%E4%B8%AD%E5%9B%BD%E7%9A%84%E5%9B%9E%E9%A1%BE%E4%B8%8E%E5%89%8D%E7%9E%BB.pdf")
  (bib-entry #:key "yangzhenning04"
             #:author "杨振宁(Yang Chen-ning)"
             #:title "《易经》对中华文化的影响"
             #:date "2004"
             #:url "https://www.aisixiang.com/data/127276.html")

  (bib-entry #:key "abelson96"
             #:author "Harold Abelson, Gerald Jay Sussman"
             #:title "Structure and Interpretation of Computer Programs"
             #:date "1996"
             #:url "https://www.aisixiang.com/data/127276.html")

(bib-entry #:key "Matthias2006"
             #:author "Matthias Felleisen, Matthew Flatt"
             #:title "Programming Languages and Lambda Calculi"
             #:date "2006"
             #:url "https://users.cs.utah.edu/~mflatt/past-courses/cs7520/public_html/s06/notes.pdf")

  (bib-entry #:key "matthew21"
             #:author "Matthew Flatt"
             #:title "Racket Compiler and Runtime Status: January 2021"
             #:date "2021"
             #:url "https://blog.racket-lang.org/2021/01/racket-status.html")

  (bib-entry #:key "dybvig09"
             #:author "R Kent Dybvig"
             #:title "The Scheme Programming Language, Four th Edition"
             #:date "2009"
             #:url "https://www.scheme.com/tspl4/")

  (bib-entry #:key "dybvig22"
             #:author "R Kent Dybvig"
             #:title "Chez Scheme Version 9 User's Guide"
             #:date "2022"
             #:url "https://cisco.github.io/ChezScheme/csug9.5/csug.html")
)
