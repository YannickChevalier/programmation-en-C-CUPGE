(TeX-add-style-hook "mytheorems"
 (lambda ()
    (LaTeX-add-environments
     "myproof"
     '("decisionproblem" 1)
     '("refcorollary" 1)
     '("refproposition" 1)
     '("reflemma" 1)
     '("reftheorem" 1)
     '("refdefinition" 1)
     "claim"
     "proofclaim"
     "proof")
    (TeX-add-symbols
     '("sortie" 1)
     '("entree" 1)
     '("entreeu" 1)
     '("checkTheorem" 2)
     '("envthm" 4)
     "change"
     "direct"
     "converse"
     "thmref")))

