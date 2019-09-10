
include /home/chevalie/bin/makefile.defs


$(eval $(call start_makefile))

# Global variables
DIST_DIR?=ychevali@bali.irit.fr:~/public_html
LOCAL_DIR?=/var/www/public_html
SHELL?=/bin/bash
LATEX?=xelatex -shell-escape 
ECHO?=echo

#directory-local variables
$(FULL_PATH)/RELATIVE_DEPLOY_DIR?=Cours/Cours-C

Cours/Cours-C/menu/contents+=$(FULL_PATH)/submenu.js 

# Les vues doivent contenir les ajouts à $(FULL_PATH)/LOCAL_FILES
# pour les variables à ajouter dans le déploiement, et définir les règles
# permettant de construire le contenu

$(FULL_PATH)/VIEWS:=web 
$(FULL_PATH)/SUBDIRS:=



$(eval $(call process_dependencies))


$(eval $(call end_makefile))


