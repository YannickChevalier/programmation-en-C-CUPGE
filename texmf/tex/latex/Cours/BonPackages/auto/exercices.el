(TeX-add-style-hook "exercices"
 (lambda ()
    (TeX-add-symbols
     '("TPquestion" 1)
     '("prob" 1)
     '("exo" 1)
     "nometudiant"
     "question"
     "reponse"
     "correction")
    (TeX-run-style-hooks
     "comment")))

