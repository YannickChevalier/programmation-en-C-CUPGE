# Variables disparaissant lors de l'inclusion dans un plus grand
# Makefile En fait, elles ne devraient exister que dans des fichiers
# "Makefile" initial (à partir duquel on compile tout)

export TEXMFHOME?=$(abspath texmf)
$(warning TEXMFHOME=$(TEXMFHOME))

SHELL?=/bin/bash
# LATEX?=env TEXMFHOME=./texmf xelatex -shell-escape 
LATEX?=xelatex -shell-escape
ECHO?=echo

##################################
#
#  Run this at the start of each Makefile inclusion
#
##################################

define begin_Makefile

MAKEFILE_STACK:=$(lastword $(MAKEFILE_LIST)) $(MAKEFILE_STACK)

$$(info *** Entering file $$(firstword $$(MAKEFILE_STACK)))

# PATH_STACK permet de garder à jour FULL_PATH lors des inclusions
# multiples.  on ajoute le répertoire courant au début du Makefile, et
# on l'enlève à la fin

PATH_STACK:=$$(abspath $$(dir $$(firstword $$(MAKEFILE_STACK)))) $$(PATH_STACK)

# FULL_PATH est la variable désignant le répertoire dans lequel se
# trouve le Makefile en cours de lecture

FULL_PATH:=$$(firstword $$(PATH_STACK))


$$(info *** Showing current position in Makefiles:)
$$(info ***            FULL_PATH=$$(FULL_PATH))
$$(info ***            PATH_STACK=$$(PATH_STACK))
$$(info ***            MAKEFILE_STACK=$$(MAKEFILE_STACK))
endef

#############################################
#
#  Lecture de la configuration de ce répertoire sur le site web
#
#############################################

define read_Web_Config

include $(FULL_PATH)/webconfig.mk

$$(FULL_PATH)/TARGET_DIR:=$$(TARGET_DIR)
$$(TARGET_DIR)/MAIN_SRC_DIR?=$$(FULL_PATH)
$$(info *** Web configuration results:)
$$(info ***            $$(FULL_PATH)/TARGET_DIR=$$($$(FULL_PATH)/TARGET_DIR))
$$(info ***            $$(TARGET_DIR)/MAIN_SRC_DIR=$$($$(TARGET_DIR)/MAIN_SRC_DIR))
endef


#############################################
#
# Run this at the end of each Makefile inclusion
#
#############################################

define end_Makefile
$(info *** Leaving file $(firstword $(MAKEFILE_STACK)))
MAKEFILE_STACK:=$$(word 2,$$(words $$(PATH_STACK)),$$(MAKEFILE_STACK))
PATH_STACK:=$$(word 2,$$(words $$(PATH_STACK)),$$(PATH_STACK))
FULL_PATH:=$$(firstword $$(PATH_STACK))
$$(info *** Showing current position in Makefiles:)
$$(info ***            FULL_PATH=$$(FULL_PATH))
$$(info ***            PATH_STACK=$$(PATH_STACK))
$$(info ***            MAKEFILE_STACK=$$(MAKEFILE_STACK))
endef

#############################################
#
# Run this in a Makefile after reading the web configuration
#
#############################################

define Set_Local_Variables
FULL_PATH:=$$(word 1,$$(PATH_STACK))
TITRE:=$$($$($$(FULL_PATH)/TARGET_DIR)/TITRE)
DIR_SUBMODULES:=$$($$($$(FULL_PATH)/TARGET_DIR)/DIR_SUBMODULES)
SUBDIRS:=$$($$($$(FULL_PATH)/TARGET_DIR)/SUBDIRS)
WEBFILES:=$$($$($$(FULL_PATH)/TARGET_DIR)/WEBFILES)
TARGET_DIR:=$$($$(FULL_PATH)/TARGET_DIR)
START_PAGE:=$$($$($$(FULL_PATH)/TARGET_DIR)/START_PAGE)
endef


#############################################
#
#  Lecture des Makefile des modules dans les sous-répertoires
#
#  Ces sous-répertoires sont mappés dans la même page que le
# répertoire courant L'inclusion est fait en toute fin de fichier afin
# de ne pas pertuber les variables définies et utilisées dans ce
# fichier.  Le chemin inclus la base du Makefile à inclure.Par
# exemple: 
#             $(FULL_PATH)/DIR_SUBMODULES:=TP/enonces TP/solutions 
# pour inclure TP/enonces.mk et TP/solutions.mk. 
#
#############################################


define register_Module
# Lors de l'inclusion, cette variable deviendra $(FULL_PATH)/MODULE
MODULE:=$(notdir $(1))
$(FULL_PATH)/$(dir $(1))MODULE:=$(notdir $(1))
# On met aussi à jour le TARGET_DIR
$(FULL_PATH)/$(dir $(1))TARGET_DIR:=$($(FULL_PATH)/TARGET_DIR)

#############################################
#
#  Addition of current module files to the web site, and how to copy them
#
#  This function can be called once the following variables have been set:
#   -- FULL_PATH
#   -- $(FULL_PATH)/TARGET_DIR
#   -- $(MODULE)
#   It will automatically include a file $(FULL_PATH)/$(MODULE).mk
#   that will:
#   -- define a variable $(FULL_PATH)/$(MODULE)/WEB_FILES that contains
#       all the files that will have to be copied on the web site
#   -- construct a file $(FULL_PATH)/$(MODULE)_submenu.js that will be inserted
#       in the TARGET_DIR  config.js file
#   -- define phony rules for this directory
#############################################


include $(FULL_PATH)/$(dir $(1))$$(MODULE).mk

$($(FULL_PATH)/TARGET_DIR)/WEB_FILES+=$$($(FULL_PATH)/$(MODULE)_WEB_FILES)
$$(info $(FULL_PATH)/$$(MODULE)_WEB_FILES=$$($(FULL_PATH)/$(MODULE)_WEB_FILES))
$$(info $($(FULL_PATH)/TARGET_DIR)/WEB_FILES=$$($($(FULL_PATH)/TARGET_DIR)/WEB_FILES))

endef



#############################################
#
#  Lecture des Makefile des sous-répertoires
#
#  Ces sous-répertoires sont mappés dans une autre page que le
# répertoire courant.  Le chemin inclus la base du Makefile à inclure.Par
# exemple: 
#             $(FULL_PATH)/SUBDIRS:=Projet 
# pour faire un lien vers la page du projet. 
#
#############################################

define Include_Page
  $$(warning Including $$(FULL_PATH)/$(1)/Makefile)
   $$(FULL_PATH)/$$(dirname $(1))VERSION:=$$(notdir $(1))
  include $$(FULL_PATH)/$(1))/Makefile
  $$(warning End of inclusion)
 # $$(eval $$(call Set_Local_Variables))
endef

#############################################
#
#  For debugging purposes, show the current values of positioning makefile  variables
#
#############################################

define positioning_parameters_show
$(info *** Now reading MODULE=$(MODULE), with main parameters:)
$(info ***            FULL_PATH=$(FULL_PATH))
$(info ***            $(FULL_PATH)/TARGET_DIR=$($(FULL_PATH)/TARGET_DIR))
endef



#############################################
#
#  For debugging purposes, show the current values of web-related variables
#
#############################################


define web_parameters_show
# $$(info *** Showing web parameters for module $(MODULE) in $(FULL_PATH))
# $$(info  ***            $(FULL_PATH)/TARGET_DIR:=$$($(FULL_PATH)/TARGET_DIR))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/DIR_SUBMODULES:=$$($($(FULL_PATH)/TARGET_DIR)/DIR_SUBMODULES))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/SUBDIRS:=$$($($(FULL_PATH)/TARGET_DIR)/SUBDIRS))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/TITRE:=$$($($(FULL_PATH)/TARGET_DIR)/TITRE))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/WEB_TEST:=$$($($(FULL_PATH)/TARGET_DIR)/WEB_TES))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/WEB_DEPLOY:=$$($($(FULL_PATH)/TARGET_DIR)/WEB_DEPLOY))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/START_PAGE:=$$($($(FULL_PATH)/TARGET_DIR)/START_PAGE))
# $$(info  ***            $($(FULL_PATH)/TARGET_DIR)/WEB_FILES:=$$($($(FULL_PATH)/TARGET_DIR)/WEB_FILE))
endef


#############################################
#
#  Compilation of a tex file into chapters
#
#  needs variables:
#  - TITRE (for chapter submenu title)
#  - BOOKNAME: name of the tex file (without extension)
#  - NUMBERS: chapters to produce (sequence of integers)
#  - CHAPTERS: pages of begin-end for each chapter (e.g. 1-8 9-18 ...)
#  - TEXFILES: files on which BOOKNAME.tex depends
#
#############################################
define rules_chapters

$$($(FULL_PATH)/TARGET_DIR)/WEB_FILES+=$(patsubst %,$(FULL_PATH)/$(MODULE)-%.pdf,$(NUMBERS))

$(FULL_PATH)/$(MODULE)-%-item.js: $(FULL_PATH)/$(BOOKNAME).pdf
	touch $$@

$(FULL_PATH)/$(MODULE)-%.pdf: $(FULL_PATH)/$(BOOKNAME).pdf
	pdftk $$< cat  $$(word $$*,$(CHAPTERS)) output $$@



$(FULL_PATH)/$(BOOKNAME).pdf: $($(FULL_PATH)/TEXFILES) 
	-( cd $(FULL_PATH) ; \
	restart="no vide"; \
	while [ "$$$$restart" != "" ]; do \
	  $(LATEX) "\def\versionname{$(MODULE)}\def\modulename{$(FORMATION)}\def\solutions{false}\def\numero{0}\input{$(FULL_PATH)/$(BOOKNAME).tex}" \
	     | tee tmp.log ; \
	  restart=`grep 'Rerun' tmp.log` ;  \
	done )

$(FULL_PATH)/$(MODULE)_submenu.js: \
	$(patsubst %,$(FULL_PATH)/$(MODULE)-%-item.js,$(NUMBERS))
	$(ECHO) "{ 'name':'$(TITRE)','type':'toclist', 'list' :" > $$@ ; \
	$(ECHO) "    [" >> $$@; \
	cat $(FULL_PATH)/empty $$^ >> $$@; \
	$(ECHO) "    ]  }," >> $$@
endef


#############################################
#
#  Compilation of TD/TP/QCM/...
#
#  needs variables:
#  - TITRE (for chapter submenu title)
#  - BASE_FILE_NAME: name of the generic tex file (td for td.tex...)
#  - NUMBERS: chapters to produce (sequence of names/doesn't have to be integers)
#  - COMPILATION_FLAGS:= other args for the generic file
#  - TEXFILES: files on which BOOKNAME.tex depends
#  - formation
#
#############################################

define rules_standalone

$$($(FULL_PATH)/TARGET_DIR)/WEB_FILES+=$(patsubst %,$(FULL_PATH)/$(BASE_FILE_NAME)-$(MODULE)-%.pdf,$(NUMBERS))

$(FULL_PATH)/$(BASE_FILE_NAME)-$(MODULE)-%.pdf \
$(FULL_PATH)/$(BASE_FILE_NAME)-$(MODULE)-%-item.js :  \
   $(FULL_PATH)/$(BASE_FILE_NAME).tex $(FULL_PATH)/$(BASE_FILE_NAME)%.tex 
	(cd $(FULL_PATH) ; \
	restart="no vide"; \
	while [ "$$$$restart" != "" ]; do \
		$(LATEX) -jobname="$(BASE_FILE_NAME)"\
		"\def\versionname{$(MODULE)}\def\numero{$$*}\def\modulename{$(FORMATION)}$(COMPILATION_FLAGS)\input{$(FULL_PATH)/$(BASE_FILE_NAME)}}" | tee tmp.log ; \
		restart=`grep 'Rerun' tmp.log` ;  \
	done ; \
	mv $(FULL_PATH)/$(BASE_FILE_NAME).pdf $(FULL_PATH)/$(BASE_FILE_NAME)-$(MODULE)-$$*.pdf )

$(FULL_PATH)/$(MODULE)_submenu.js: \
	$(patsubst %,$(FULL_PATH)/$(BASE_FILE_NAME)-$(MODULE)-%-item.js,$(NUMBERS))
	$(ECHO) '{ "name":"$(TITRE)","type":"toclist", "list" :' > $$@ ; \
	$(ECHO) "    [" >> $$@; \
	cat $(FULL_PATH)/empty $$^ >> $$@; \
	$(ECHO) "    ]  }," >> $$@
endef

#############################################
#############################################
##
##
##     Beginning of the real Makefile
##
##
#############################################
#############################################



#
# Configuration pour la page Web
#

$(eval $(read_Web_Config))

$(eval $(web_parameters_show))


$(foreach module,$($(TARGET_DIR)/DIR_SUBMODULES),\
	$(eval $(call register_Module,$(module))))

$(foreach page,$($(FULL_PATH)/SUBDIRS),\
	$(eval $(call Include_Page,$(page))))

#############################################
#
# Mise à jour de la page
#
#############################################


define rules_main

$(FULL_PATH)/config.js: \
	$$(patsubst %,$(FULL_PATH)/%_submenu.js,$($(TARGET_DIR)/DIR_SUBMODULES))
	printf "{ 'name': 0,\n'init_page' : '%s',\n'page_title' : '<center><h1>%s</h1></center>',\n  'tableOfContents':\n    [\n{ 'name':'Home','type':'toclink','url': state[\"site\"]+state[\"base_path\"]},\n{ 'name':'Autres cours','type':'toclink','url': state[\"site\"]+state[\"base_path\"]+ \"Cours/\"},\n"  \
	"$($($(FULL_PATH)/TARGET_DIR)/START_PAGE)" \
	"$($($(FULL_PATH)/TARGET_DIR)/TITRE)" > $$@
	cat $(FULL_PATH)/empty $$^ >> $$@
	printf "\t]\t}\n" >> $$@

$(FULL_PATH)/deploy:
	rsync -aP \
	$($($(FULL_PATH)/TARGET_DIR)/WEB_TEST)/$($(FULL_PATH)/TARGET_DIR)/* \
	$($(TARGET_DIR)/WEB_DEPLOY)/$($(FULL_PATH)/TARGET_DIR)/

$(FULL_PATH)/test: $($($(FULL_PATH)/TARGET_DIR)/WEB_FILES) $(FULL_PATH)/config.js
	cp -u $$? $($($(FULL_PATH)/TARGET_DIR)/WEB_TEST)/$($(FULL_PATH)/TARGET_DIR)/
endef


$(eval $(rules_main))


