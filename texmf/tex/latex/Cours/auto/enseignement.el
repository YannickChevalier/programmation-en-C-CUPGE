(TeX-add-style-hook "enseignement"
 (lambda ()
    (TeX-add-symbols
     '("TPquestion" 1)
     '("prob" 1)
     '("exo" 1)
     "nom"
     "question"
     "reponse")
    (TeX-run-style-hooks
     "comment")))

