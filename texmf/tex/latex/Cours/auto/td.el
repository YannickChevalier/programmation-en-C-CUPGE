(TeX-add-style-hook "td"
 (lambda ()
    (TeX-add-symbols
     '("mref" 1)
     '("mmesidevoir" 1)
     '("mmesiqcm" 1)
     '("mmesitp" 1)
     '("mmesitd" 1)
     '("esialtp" 1)
     '("esialtd" 1)
     '("maittp" 1)
     '("maittd" 1)
     '("stpitp" 1)
     '("stpitd" 1)
     "ups"
     "uhp"
     "plg"
     "esial"
     "consigne"
     "Partie"
     "Question")
    (TeX-run-style-hooks
     "varioref"
     "beton"
     "exemple"
     "algorithm"
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
     "latex2e"
     "art11"
     "article"
     "french"
     "11pt"
     "commun"
     "caracteres"
     "enseignement")))

