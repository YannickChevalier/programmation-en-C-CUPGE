(TeX-add-style-hook "course"
 (lambda ()
    (LaTeX-add-environments
     "flist")
    (TeX-add-symbols
     '("mref" 1)
     "setlabel"
     "chapitreQRcode")
    (TeX-run-style-hooks
     "textpos"
     "absolute"
     "pst-barcode"
     "auto-pst-pdf"
     "algorithm"
     "graphicx"
     "maths"
     "entetes"
     "exercices"
     "formations"
     "Myencodings"
     "utf8"
     "english"
     "varioref"
     "babel"
     "french"
     "url"
     "geometry"
     "art10"
     "article"
     "twocolumn"
     "bk10"
     "book"
     "a4paper"
     "iritslides"
     "latex2e"
     "beamer10"
     "beamer"
     "handout"
     "xcolor"
     "yearcomputation")))

