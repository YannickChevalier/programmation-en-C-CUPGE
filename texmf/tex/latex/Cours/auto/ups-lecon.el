(TeX-add-style-hook "ups-lecon"
 (lambda ()
    (TeX-add-symbols
     '("mmesitp" 1)
     '("mmesitd" 1)
     '("esialtp" 1)
     '("esialtd" 1)
     '("maittp" 1)
     '("maittd" 1)
     '("stpitp" 1)
     '("stpitd" 1)
     '("mref" 1)
     "ups"
     "uhp"
     "plg"
     "esial")
    (TeX-run-style-hooks
     "varioref"
     "french"
     "avant"
     "exemple"
     "algorithm"
     "chapter"
     "vmargin"
     "pst-plot"
     "pst-node"
     "pstcol"
     "dvips"
     "hyperref"
     "geometry"
     "graphicx"
     "color"
     "comment"
     "eurosym"
     "ifpdf"
     "ifvtex"
     "Cours/commun"
     "Cours/caracteres"
     "Cours/enseignement")))

