#! /usr/bin/env racket
#lang racket

(require net/url)
(require json)

(define url "http://mileendroulette.com/hungry/random")

(define (food url) 
  (define input (get-pure-port (string->url url)))
  (define response (port->string input))
  (define data (string->jsexpr response))
  (displayln (hash-ref data 'name))
  (displayln (hash-ref data 'address))
  (close-input-port input))

(food url)
