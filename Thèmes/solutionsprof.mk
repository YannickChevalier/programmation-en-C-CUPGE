$(eval $(begin_Makefile))
$(eval $(positioning_parameters_show))
$(eval $(web_parameters_show))

#
# Ces variables sont utilisées pour paramétriser la compilation.
#

NUMBERS:=Types Tableaux EntréesSorties Git Fractions
BASE_FILE_NAME:=tp
COMPILATION_FLAGS:=\def\solutions{true}\def\solutionscachee{true}
TITRE:=Travaux Pratiques (Sol.)

$(eval $(rules_standalone))
$(eval $(end_Makefile))

