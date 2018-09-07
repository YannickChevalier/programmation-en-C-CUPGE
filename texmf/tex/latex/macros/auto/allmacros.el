(TeX-add-style-hook "allmacros"
 (lambda ()
    (LaTeX-add-environments
     "ilitz"
     "personal")
    (TeX-add-symbols
     '("interpret" ["argument"] 1)
     '("defsd" 1)
     '("open" 2)
     '("trace" 2)
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
     '("shortaci" 1)
     '("aci" 1)
     '("nded" 1)
     '("nintrus" 1)
     '("intrus" 3)
     '("oraclenorm" 1)
     '("normo" 1)
     '("norm" 1)
     '("normi" 2)
     '("rhnorm" 2)
     '("vsig" 1)
     '("gsig" 1)
     '("sig" 1)
     '("tuple" 1)
     '("ConstrSys" 1)
     '("Context" 2)
     '("Clause" 3)
     '("condset" 2)
     '("set" 1)
     '("call" 1)
     "tq"
     "ded"
     "prele"
     "union"
     "Nat"
     "Rat"
     "Real"
     "atomordering"
     "termordering"
     "Constants"
     "Variables"
     "atomes"
     "unif"
     "minic"
     "combintrus"
     "xor"
     "DY"
     "comp"
     "sfree"
     "sfreep"
     "Ind"
     "Invar"
     "Outvar"
     "Nonces")
    (TeX-run-style-hooks
     "tikzSD"
     "xspace")))

