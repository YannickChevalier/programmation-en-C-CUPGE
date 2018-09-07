(TeX-add-style-hook "tad"
 (lambda ()
    (LaTeX-add-environments
     "wpFunction"
     '("wpVar" 1)
     '("wpWhileLoop" 1)
     '("wpIfThenElse" 1)
     '("axiomlist" 1)
     '("type" 1)
     '("formule" 1)
     "operateurs"
     "preconditions"
     "axiomes"
     "wpFormulaBlock"
     "wpCodeBlock"
     "wpBlock"
     "wpSpecif"
     "wpPreuve")
    (TeX-add-symbols
     '("egal" ["argument"] 1)
     '("rais" ["argument"] 2)
     '("TADHorn" ["argument"] 2)
     '("TADeq" ["argument"] 2)
     '("newTADax" ["argument"] 1)
     '("TADmodule" ["argument"] 1)
     '("raistext" 1)
     '("noegal" 1)
     '("pfp" 2)
     '("TADcoer" 2)
     '("TADpre" 2)
     '("variables" 1)
     '("newTADox" 3)
     '("newTADop" 3)
     '("renommage" 2)
     '("extensionde" 1)
     '("sortes" 1)
     '("tadComment" 1)
     '("userfunction" 1)
     '("tadMod" 1)
     '("wpkw" 1)
     '("tadkw" 1)
     "tadCommentSignBegin"
     "tadCommentSignEnd"
     "ELSE"
     "VARIANT"
     "INVARIANT"
     "makeuserfunction"
     "maketadkw"
     "MakeTADkw"
     "impl"
     "operation"
     "precondition"
     "nom"
     "n"
     "twon"
     "et"
     "implique"
     "commentaire"
     "makewpkw"
     "MakeWPkw"
     "wpCVARIABLES"
     "semicolon"
     "lignecode"
     "THEN")
    (TeX-run-style-hooks
     "amsmath"
     "iterators"
     "ifthen")))

