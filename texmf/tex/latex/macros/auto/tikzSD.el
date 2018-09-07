(TeX-add-style-hook "tikzSD"
 (lambda ()
    (TeX-add-symbols
     "arrowlength"
     "parseleftoutput"
     "parserightoutput"
     "outleft"
     "parsenooutput"
     "sdnodetype"
     "parsetype"
     "parseoutput"
     "typeOf"
     "sdunitfactor"
     "abscisse"
     "ordonnee"
     "nodename"
     "currentnodename"
     "sdnode"
     "symbolicderivation"
     "varname"
     "outputstate"
     "nodevariable"
     "nodeequation"
     "inputstate"
     "inleft"
     "tracingall"
     "lastvisible"
     "connecttoright"
     "connecttoleft"
     "orderto")
    (TeX-run-style-hooks
     "tikz"
     "expl3")))

