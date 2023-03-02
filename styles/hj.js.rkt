#lang racket/base

(require scribble/core
         scribble/base
         scribble/html-properties
         racket/runtime-path)
(provide js/highlight-jumping)

(define-runtime-path hj.js "hj.js")

(define js/highlight-jumping
  (elem #:style (make-style #f
                            (list (make-js-addition hj.js)))))
