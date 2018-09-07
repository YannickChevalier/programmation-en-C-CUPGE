(TeX-add-style-hook "preamble"
 (lambda ()
    (LaTeX-add-environments
     "ilitz"
     "personal")
    (TeX-add-symbols
     '("interpret" ["argument"] 1)
     '("symtest" 2)
     '("msg" 2)
     '("pideux" 1)
     '("piun" 1)
     '("paire" 2)
     '("pverif" 3)
     '("psig" 2)
     '("sdec" 2)
     '("senc" 2)
     '("pdec" 2)
     '("penc" 2)
     '("fact" 1)
     '("head" 1)
     '("parti" 1)
     '("rhparti" 2)
     '("preserve" 1)
     '("oraclenorm" 1)
     '("normo" 1)
     '("norm" 1)
     '("normi" 2)
     '("rhnorm" 2)
     '("open" 2)
     '("trace" 2)
     '("past" 1)
     '("class" 1)
     '("engendre" 1)
     '("nded" 1)
     '("nintrus" 1)
     '("defsd" 1)
     '("intrus" 3)
     '("condset" 2)
     '("set" 1)
     '("vsig" 1)
     '("gsig" 1)
     '("sig" 1)
     '("shortaci" 1)
     '("aci" 1)
     '("tuple" 1)
     '("ConstrSys" 1)
     '("Context" 2)
     '("Clause" 3)
     '("call" 1)
     '("fullref" 1)
     '("MyAuthor" 3)
     '("MyConf" 3)
     "tq"
     "rinput"
     "atomordering"
     "termordering"
     "Nat"
     "Rat"
     "Real"
     "Constants"
     "Variables"
     "atomes"
     "ded"
     "prele"
     "unif"
     "minic"
     "Nonces"
     "combintrus"
     "Ind"
     "Invar"
     "Outvar"
     "xor"
     "emc"
     "DY"
     "Id"
     "union"
     "direct"
     "converse"
     "sfree"
     "sfreep"
     "status"
     "preparetitle"
     "comp")
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
     "art10"
     "article"
     "llncs10"
     "llncs")))

