;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Battleship_server_beta) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/universe)

; UniverseState is '*, that is, there is no interesting Universe state info.
; Messages
; -- 'done, a stop message FROM a client
; -- 'it-is-your-turn, a go message TO a client

; Bundle is
;   (make-bundle UniverseState [Listof mail?] [Listof iworld?])

; Result is
;   (make-bundle [Listof iworld?]
;                (list (make-mail iworld? GoMessage))
;                '())
 
; add-world: [ListOf Iworld] Iworld -> Result
; add world iw to the universe, when server is in state u
; an obvious example for adding a world:
(check-expect
  (add-world empty iworld1)
  (make-bundle (list iworld1)
               (list (make-mail iworld1 '(-5 -5 #f)))
               '()))
(define (add-world univ wrld)
  (local ((define univ* (append univ (list wrld))))
    (make-bundle univ*
                 (list (make-mail (first univ*)
                                  (cond
                                    [(empty? univ) '(-5 -5 #f)]
                                    [else '(-1 -1 #f)])))
                 empty)))
 
; switch: [ListOf Iworld] Iworld 'done -> Result
; world iw sent message m when server is in state u
; an example for receiving a message from the active world:
(check-expect
 (switch (list iworld1 iworld2) iworld1 5)
 (make-bundle (list iworld2 iworld1)
              (list (make-mail iworld2 5))
              empty))
(define (switch univ wrld m)
  (local ((define univ* (append (rest univ) (list (first univ)))))
    (make-bundle univ*
                 (list (make-mail (first univ*) m))
                 empty)))

(define (start-server)
  (universe empty 
            (on-new add-world) 
            (on-msg switch)))

(start-server)