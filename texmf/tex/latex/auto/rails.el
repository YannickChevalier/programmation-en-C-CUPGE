(TeX-add-style-hook "rails"
 (lambda ()
    (LaTeX-add-environments
     '("rubycode" 1)
     "relation")
    (TeX-add-symbols
     "Application"
     "ApplicationName"
     "AfterIncludedComment"
     "CommentCutFile"
     "openfile"
     "shellcode"
     "module"
     "modele"
     "controleur"
     "vue"
     "champs"
     "shelladdmethod"
     "setassoc"
     "setindex"
     "setuniqueindex")
    (TeX-run-style-hooks
     "multicol"
     "verbatim"
     "comment"
     "ifthen"
     "beton"
     "babel"
     "french"
     "fontenc"
     "T1"
     "inputenc"
     "latin1")))

