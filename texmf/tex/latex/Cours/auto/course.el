(TeX-add-style-hook "course"
 (lambda ()
    (LaTeX-add-environments
     "flist")
    (TeX-add-symbols
     '("mref" 1))
    (TeX-run-style-hooks
     "algorithm"
     "graphicx"
     "geometry"
     "entetes"
     "exercices"
     "formations"
     "Myencodings"
     "utf8"
     "english"
     "varioref"
     "babel"
     "french"
     "art10"
     "article"
     "xcolor"
     "latex2e"
     "bk10"
     "book"
     "a4paper"
     "yearcomputation")))

