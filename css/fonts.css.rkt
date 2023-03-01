#lang racket/base

(require scribble/core
         scribble/base
         scribble/html-properties
         racket/runtime-path)
(provide css/wenquan-extend-font)

(define-runtime-path fonts.css "fonts.css")

(define css/wenquan-extend-font
  (elem #:style (make-style #f
                            (list (make-css-addition fonts.css)))))
