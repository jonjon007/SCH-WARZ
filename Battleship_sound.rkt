;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Battleship_sound) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require racket/gui)

(provide LUST-SIN)
(provide BG)
(provide VOICES)
(provide DAMAGE)
(provide DESTROY)
(provide BOMB)
(provide MISS)
(provide sfx)

(define LUST-SIN "lust-sin.wav")    ; path to audio file (windows can only play .wav)

(define BG "BG.wav")
(define VOICES (list "Commando_Lose.wav" "Commando_Win.wav"
                     "Terminator_Lose.wav" "Terminator_Win.wav"
                     "Last_Action_Lose.wav" "Last_Action_Win.wav"
                     "Eraser_Lose.wav" "Eraser_Win.wav"
                     "Total_Recall_Lose.wav" "Total_Recall_Win.wav"
                     "Start.wav"))
(define DAMAGE (list "damage1.wav" "damage2.wav" "damage3.wav"))
(define DESTROY (list "destroy1.wav" "destroy2.wav" "destroy3.wav"))
(define BOMB "bomb.wav")
(define MISS "splash.wav")

(define (sfx fle)
  (play-sound fle #t))
;(sfx LUST-SIN)