(TeX-add-style-hook "cours-C-def"
 (lambda ()
    (LaTeX-add-environments
     "mots"
     '("example" 1)
     "Ccode"
     "note"
     "algo"
     "pshell")
    (TeX-add-symbols
     '("shellcommand" 1)
     '("mywarning" 1)
     '("mycaption" 1)
     '("cvar" 1)
     '("cprintf" 1)
     '("ckeyword" 1)
     '("ccomment" 1)
     '("cstring" 1)
     '("ctype" 1)
     '("cfun" 1)
     '("cpp" 1)
     '("syslib" 1)
     '("cinclude" 1)
     '("mimp" 1)
     '("imp" 1)
     "bslash"
     "cmain"
     "cmaindef"
     "cint"
     "cchar"
     "cvoid"
     "cfloat"
     "cdouble"
     "stdio"
     "ctab"
     "lb"
     "rb"
     "cnl"
     "diff"
     "cif"
     "celse"
     "cfor"
     "cwhile"
     "cswitch"
     "cdefault"
     "ccase"
     "cbreak"
     "cdo"
     "cnon"
     "cou"
     "cet"
     "creturn"
     "cenum"
     "cstruct"
     "cunion"
     "ctypedef"
     "n"
     "ct"
     "exemplecaption"
     "gcc"
     "xemacs"
     "cbt"
     "npblistoftables"
     "npblistoffigures"
     "npblistofalgorithms"
     "npblistofexemples")))

