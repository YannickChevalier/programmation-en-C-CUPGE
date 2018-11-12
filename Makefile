# Yannick Chevalier, 2018
SHELL:=/bin/bash
BRANCHES=configuration enonces enseignants solutions solutionsprof 


a_nom_de_branche_solution/%:: \
	THEME = $(shell awk -F + '{print $$1;}' <<< $* ) 

a_nom_de_branche_solution/%:: \
	EXERCICE = $(shell awk -F + '{print $$2;}' <<< $* ) 

a_nom_de_branche_solution/%::
	if [ -z $(THEME) ] ; then \
		printf "Thème non défini.\n" ; \
		exit 1 ; \
	fi ; \
	if [ -z $(EXERCICE) ] ; then \
		printf "Exercice non défini.\n" ; \
		exit 1 ; \
	fi
	@echo "THEME=$(THEME)" 
	@echo "EXERCICE=$(EXERCICE)" 


list_all_correction_branches: \
	CORRECTION_BRANCHES = $( shell git branch | sed -n '/\+/{ s/ *// ; s/\+.*//; p }' | sort -u )

list_unpublished_correction_branches: \
	UNPUBLISHED_CORRECTION_BRANCHES = $( shell git branch --no-merged solutions | sed -n '/\+/{ s/ *// ; s/\+.*//; p }' | sort -u )


update_index: 
	if ! git diff -s --exit-code ; then \
		git add . ; \
	fi

update_local_branch:
	if ! git diff -s --cached --exit-code ; then \
		printf "Message pour le commit ?\n" ; \
		read message ; \
		git commit -m "$${message}" ; \
	fi

push: 
	branch=$$(git branch | grep \* | cut -d ' ' -f2) ; \
	repos=( $$(git config --file .gitconfig --get-all branch.$${branch}.repository) ) ; \
	for rep in $${repos[@]} ; do \
		git push $${rep} $${branch} ; \
	done 


push_all:
	branches=$$(git branch | sed -e 's/\*//g' -e 's/ //g' ); \
	for b in $${branches} ; do \
		git-cache-meta --store ; \
		git checkout $$b ; \
		git-cache-meta --apply ; \
		make push ; \
	done
	git checkout enseignants
	git-cache-meta --apply 

pull: 
	branches=$$(git branch | sed -e 's/\*//g' -e 's/ //g' ); \
	for branch in $(BRANCHES) ; do \
		git-cache-meta --store ; \
		git checkout $${branch} ; \
		git-cache-meta --apply ; \
		git pull -Xtheirs cours $${branch} ; \
	done
	git checkout enseignants
	git-cache-meta --apply

commit:: update_index

commit:: update_local_branch

commit:: 
	branch=$$(git branch | grep \* | cut -d ' ' -f2) ; \
	dependants=( $$(git config --file .gitconfig --get-all branch.$${branch}.dependants) ) ; \
	for dep in $${dependants[@]} ; do \
		git-cache-meta --store ; \
		git checkout $${dep} ; \
		git-cache-meta --apply ; \
		git merge $${branch}  ; \
		make commit ; \
	done ; \
	git checkout $${branch}
	git-cache-meta --apply

change_branch/%: update_index update_local_branch
	if [ $$(git rev-parse --abbrev-ref HEAD) != "$*" ] ; then \
		git-cache-meta --store ; \
		git checkout $* ; \
		git-cache-meta --apply ; \
	fi

Thèmes/tp-enonces-%.pdf: Thèmes/tp%.tex Thèmes/tp.tex
	cd Thèmes ; ./compile.sh "$*"

Thèmes/tp-solutions-%.pdf: Thèmes/tp%.tex Thèmes/tp.tex
	cd Thèmes ; ./compile.sh "$*"


public_enonces:: change_branch/enseignants
	\rm Thèmes/tp-enonces*.pdf

public_enonces:: commit

public_enonces:: $(patsubst Thèmes/tp%.tex,Thèmes/tp-enonces-%.pdf,$(wildcard Thèmes/tp?*.tex))
	git add $(<)
	git commit -m "Mise à jour des énoncés pdf sur la branche enseignants"

public_enonces::
	version=$$(git log HEAD | head -1 | awk '{print $$2; }')  ; \
	git-cache-meta --store ; \
	git checkout enonces ; \
	git-cache-meta --apply ; \
	\rm $(patsubst Thèmes/tp%.tex,Thèmes/tp-enonces-%.pdf,$(wildcard Thèmes/tp?*.tex)) ; \
	git commit -am "suppression des anciens fichiers d'énoncés"
	git cherry-pick $${version}

public_enonces:: commit

public_enonces:: push

nouvelle_correction/%: a_nom_de_branche_solution/%
	@printf "Donnez une correction dont cette correction dépend (et laissez vide s'il n'y a pas de dépendances) ?"
	read origin ; \
	if [ -z $${origin} ] ; then origin=solutions ; fi ; \
	if 1>/dev/null git rev-parse -sq --verify "$(THEME)+$(EXERCICE)" ; then \
		echo "Cette correction existe déjà." ; \
	else \
		git-cache-meta --store ; \
		git checkout $${origin} ; \
		git-cache-meta --apply ; \
		git checkout -b "$(THEME)+$(EXERCICE)" ; \
		git-cache-meta --apply ; \
	fi

modifier_correction:
	-@branches=( $$(git branch | sed -n '/\+/{ s/ *// ; s/\+.*//; p }' | sort -u) ) ; \
	printf "Quelle est le thème de l'exercice à modifier ?\n" ; \
	for i in "$${!branches[@]}"; do \
		printf "%s\t%s\n" "$$i" "$${branches[$$i]}" ; \
	done ; \
	read indice_theme ; \
	theme=$${branches[$${indice_theme}]} ; \
	printf "Dans le thème %s, quel est l'exercice à modifier ?\n" "$${theme}" ; \
	exercices=( $$(git branch | sed -n '/'"$${theme}"'\+/{ s/ *[^+]*+// ; p }' | sort -u) ) ; \
	for i in "$${!exercices[@]}"; do  \
		printf "%s\t%s\n" "$$i" "$${exercices[$$i]}" ; \
	done ; \
	read indice_exercice ; \
	exercice=$${exercices[$${indice_exercice}]}; \
	printf "Vous avez choisi de modifier l'exercice %s du thème %s qui est dans la branche %s.\n" \
	"$${exercice}" "$${theme}" "$${theme}+$${exercice}"
	make "change_branche/$${theme}+$${exercice}"

diffuser_correction_enseignants/%:
	@branche=$* ; \
	theme=$$( awk -F + '{print $$1;}' <<< $${branche} ) ; \
	exercice=$$(awk -F + '{print $$2;}' <<< $${branche} ) ; \
	if [ -z "$${theme}" ] ; then \
		printf "Thème non défini.\n" ; \
		exit 1 ; \
	fi ; \
	if [ -z "$${exercice}" ] ; then \
		printf "Exercice non défini.\n" ; \
		exit 1 ; \
	fi ; \
	if 1>/dev/null git rev-parse -sq --verify "$${theme}+$${exercice}" ; then \
		make change_branch/$* ; \
		git add . ; \
		git commit -am "Correction de l'exercice $${exercice} du theme $${theme}" ; \
		git push cours $* ; \
	else \
		printf "Erreur, la correction %s+%s n'existe pas.\n" "$${theme}" "$${exercice}" ; \
	fi




nouvelle_branche::
	@printf "Donnez le nom d'une branche à créer:\n" ; \
	read branch ; \
	printf "Sur quelle branche est-elle basée ?\n" ; \
	read origin ; \
	printf "Dans quels repos faut-il la stocker ?\n" ; \
	read repos ; \
	printf "De quelles branches dépend-t-elle principalement ?\n" ; \
	read deps ; \
	make change_branch/$${origin} ; \
	git-cache-meta --store ; \
	git checkout -b $${branch} ; \
	git-cache-meta --apply ; \
	make push ; \
	git-cache-meta --store ; \
	git checkout configuration ; \
	git-cache-meta --apply ; \
	for dep in configuration ${deps[@]} ; do \
		git config --file .gitconfig --add "branch.$${dep}.dependants" "$${branch}" ; \
	done ; \
	for rep in $${repos[@]} ; do \
		git config --file .gitconfig --add "branch.$${branch}.repository" "$${rep}" ; \
	done

nouvelle_branche:: commit
	git-cache-meta --store 
	git checkout configuration
	git-cache-meta --apply


init:
	git config --local merge.ours.name "keep branch version"
	git config --local merge.ours.driver "./bin/ours"
	git config --local merge.theirs.name "always import new version"
	git config --local merge.theirs.driver "./bin/theirs"

etudiants:
	@echo "Bonjour les amis !"
	@echo "Vous allez bien ?"

compilation:
	cd Thèmes ; ./compile.sh

publication: compilation
	echo "Message pour le commit ?"
	read msg ; \
	git add . ; \
	git commit -m "$${msg}" ; \
	git push cours enseignants ; \
	git-cache-meta --store ; \
	git checkout enonces ; \
	git-cache-meta --apply ; \
	git checkout enseignants -- $(wildcard Thèmes/tp-enonces-*.pdf) ; \
	git add . ; \
	git commit -m "$${msg}" ; \
	git push cours enonces ; \
	git push cours-public enonces ; \
	git-cache-meta --store ; \
	git checkout solutions ; \
	git-cache-meta --apply ; \
	git checkout enseignants -- $(wildcard Thèmes/tp-solutions-*.pdf) ; \
	git add . ; \
	git commit -m "$${msg}" ; \
	git-cache-meta --store ; \
	git push cours solutions ; \
	git checkout solutionsprof ; \
	git-cache-meta --apply ; \
	git checkout enseignants -- $(wildcard Thèmes/tp-solutionsprof-*.pdf) ; \
	git add . ; \
	git commit -m "$${msg}" ; \
	git push cours solutionsprof ; \
	git-cache-meta --store ; \
	git checkout enseignants ; \
	git-cache-meta --apply

