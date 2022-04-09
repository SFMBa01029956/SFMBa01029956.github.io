#|
A01029956
Salvador Federico Milanes Braniff
18-03-2022
|#

#lang racket

(require racket/trace)

(provide  automaton-1
          trace-automaton-1
          arithmetic-lexer)

(struct dfa-str(initial-state accept-states transitions))

(define (sign? char)
  (member char '(#\+ #\-)))

(define (operator? char)
  (member char '(#\= #\* #\^)))

(define (special? char)
  (member char '(#\$)))

(define (automaton-1 dfa input-string)
  " Determine whether a string is valid in a given language or not."
  (trace-let loop
    ([state (dfa-str-initial-state dfa)]  ; CURRENT STATE
     [chars (string->list input-string)]  ; CHAR LIST
     [result null])
    (if(empty? chars)
      ; CHECK IF FINAL STATE IS IN THE ACCEPT-STATES LIST
      ; 
      ;(if (member state (dfa-str-accept-states dfa))
        ;(reverse (cons result 
      (if (member state (dfa-str-accept-states dfa))
        (reverse (cons state result)) #f)
      ; Else
      (let-values 
        ([(token state) ((dfa-str-transitions dfa) state (car chars))])
        (loop 
          ; APPLY TRANSITION Fx TO GET NEXT STATE
          state
          ; CALL AGAIN WITH REMAINING CHARS
          (cdr chars)
          (if token (cons token result) result))))))

(define (arithmetic-lexer expr)
  (automaton-1 (dfa-str 'start '(int var float com val&sp) delta-expr) expr))

; MODIFICAR-> DETECCION DE ELEMENTO C/ CAMBIOS DE ESTADO"
(define (delta-expr state character)
  (case state
    ['start (cond
      [(sign? character) (values #f 'sign&x)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values #f 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'slash&x)]
      [(char-whitespace? character) (values #f 'start)]
      [else (values #f 'fail)])]

    ['sign&x (cond
      [(sign? character) (values #f 'fail)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values 'sign&x 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values 'sign&x 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'fail)]
      [(char-whitespace? character) (values #f 'fail)]
      [else (values #f 'fail)])]

    ['int (cond
      [(sign? character) (values 'int 'op)]
      [(operator? character) (values 'int 'op)]
      [(char-numeric? character) (values #f 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'fail)]
      [(eq? character #\.) (values #f 'int&dt)]
      [(eq? character #\/) (values 'int 'slash&x)]
      [(char-whitespace? character) (values 'int 'val&sp)]
      [else (values #f 'fail)])]

    ['op (cond
      [(sign? character) (values 'op 'sign&x)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values 'op 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values 'op 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'fail)]
      [(char-whitespace? character) (values #f 'op)]
      [else (values #f 'fail)])]

    ['val&sp (cond
      [(sign? character) (values #f 'op)]
      [(operator? character) (values #f 'op)]
      [(char-numeric? character) (values #f 'fail)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'fail)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'slash&x)]
      [(char-whitespace? character) (values #f 'val&sp)]
      [else (values #f 'fail)])]

    ['int&dt (cond
      [(sign? character) (values #f 'fail)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values #f 'float)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'fail)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'fail)]
      [(char-whitespace? character) (values #f 'fail)]
      [else (values #f 'fail)])]

    ['float (cond
      [(sign? character) (values 'float 'op)]
      [(operator? character) (values 'float 'op)]
      [(char-numeric? character) (values #f 'float)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'fail)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values 'float 'slash&x)]
      [(char-whitespace? character) (values 'float 'val&sp)]
      [else (values #f 'fail)])]

    ['var (cond
      [(sign? character) (values 'var 'op)]
      [(operator? character) (values 'var 'op)]
      [(char-numeric? character) (values #f 'var)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values 'var 'slash&x)]
      [(char-whitespace? character) (values 'var 'val&sp)]
      [else (values #f 'fail)])]

    ['slash&x (cond
      [(sign? character) (values #f 'sign&x)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values 'op 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values 'op 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'com)]
      [(char-whitespace? character) (values 'op 'op)]
      [else (values #f 'fail)])]

    ['par (cond
      [(sign? character) (values #f 'sign&x)]
      [(operator? character) (values #f 'fail)]
      [(char-numeric? character) (values #f 'int)]
      [(or (char-alphabetic? character) (eq? character #\_)) (values #f 'var)]
      [(eq? character #\.) (values #f 'fail)]
      [(eq? character #\/) (values #f 'fail)]
      [(char-whitespace? character) (values #f 'par)]
      [else (values #f 'par)])]

    ['com (values #f 'com)]
    ['fail (values #f 'fail)]))