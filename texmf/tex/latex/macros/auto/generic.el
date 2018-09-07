(TeX-add-style-hook "generic"
 (lambda ()
    (TeX-add-symbols
     '("fact" 1)
     '("head" 1)
     '("parti" 1)
     '("rhparti" 2)
     '("preserve" 1)
     '("past" 1)
     '("class" 1)
     '("engendre" 1)
     "status"
     "myref"
     "getlogin"
     "getdomain"
     "p"
     "parse"
     "acm"
     "no"
     "ProcessConference"
     "comma"
     "aux"
     "PrepareTitle")
    (TeX-run-style-hooks
     "empheq"
     "subfig"
     "algorithmic"
     "algorithm"
     "url"
     "paralist"
     "inputenc"
     "utf8"
     "enumerate"
     "comment"
     "xspace"
     "proof"
     "amsfonts"
     "amssymb"
     "amsmath"
     "easychair10"
     "easychair"
     "expl3")))

