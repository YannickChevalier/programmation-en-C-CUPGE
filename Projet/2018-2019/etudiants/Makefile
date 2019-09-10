GROUPES:= \
	Amiel-Combelles \
	ArnauldDesLions-Prouvost \
	Bouhier-BaselgaColas \
	Buissiere-Girres \
	CadeauCompte-Guitard \
	Carrie-Hamdani \
	Cathala-PongLoi \
	Cohenca-Guerin \
	ElRifai \
	Gonthier-Kwan \
	Hamdi-Yao \
	Murugadass-Periard
#
Amiel-Combelles/base:=bitbucket.org:amielcombelles
Amiel-Combelles/directory:=projet
Amiel-Combelles/pre:=Projet Info - Rapport 1 - Amiel Combelles.pdf
Amiel-Combelles/post:=Projet Info - Rapport 2 - Amiel Combelles.pdf
#
ArnauldDesLions-Prouvost/base:=bitbucket.org-ychevali:MilkyW4y
ArnauldDesLions-Prouvost/directory:=prouvost-arnaulddeslions
ArnauldDesLions-Prouvost/pre:=doc/Projet en langage C_.pdf
ArnauldDesLions-Prouvost/post:=doc/Rapport Final.pdf
#
Bouhier-BaselgaColas/base:=bitbucket.org:lucabc
Bouhier-BaselgaColas/directory:=bouhier-baselga-colas
Bouhier-BaselgaColas/pre:=doc/Projet BOUHIER:BASELGA-COLAS.pdf
Bouhier-BaselgaColas/post:=
#
Buissiere-Girres/base:=bitbucket.org:malobp
Buissiere-Girres/directory:=projet-buissiere-girres
Buissiere-Girres/pre:=doc/RAPPORT BUISSIERE GIRRES.pdf
Buissiere-Girres/post:=
#
CadeauCompte-Guitard/base:=bitbucket.org:ancadeau
CadeauCompte-Guitard/directory:=guitard-cadeau
CadeauCompte-Guitard/pre:=doc/Première phase : Description du projet.pdf
CadeauCompte-Guitard/post:=
# 
Carrie-Hamdani/base:=bitbucket.org:dalalhamdani
Carrie-Hamdani/directory:=carrie-hamdani
Carrie-Hamdani/pre:=docs/PROJET D'INFO RAPPORT 1 -V5.pdf
Carrie-Hamdani/post:=docs/PROJET D'INFO  RAPPORT FINAL -V2.pdf
#
Cathala-PongLoi/base:=bitbucket.org-ychevali:pldarren
Cathala-PongLoi/directory:=pong_loi-cathala
Cathala-PongLoi/pre:=doc/rapport1.pdf
Cathala-PongLoi/post:=doc/Rapport final PONG_LOI-CATHALA.pdf
#
Cohenca-Guerin/base:= bitbucket.com:gabrielguerin
Cohenca-Guerin/directory:=guerin-cohenca
Cohenca-Guerin/pre:=Rapport première partie.pdf
Cohenca-Guerin/post:=Rapport-final.pdf
#
ElRifai/base:= github.com:omarwaddah
ElRifai/directory:=proj
ElRifai/pre:=
ElRifai/post:=
#
Gonthier-Kwan/base:=github.com:LuguyGonthier
Gonthier-Kwan/directory:=projet
Gonthier-Kwan/pre:=doc/Rapport Projet S3.pdf
Gonthier-Kwan/post:=doc/Rapport Final GONTHIER KWAN.pdf
#
Hamdi-Yao/base:= bitbucket.com:leevvei
Hamdi-Yao/directory:=yao-hamdi
Hamdi-Yao/pre:=doc/cr1 projet info.pdf
Hamdi-Yao/post:=
#
Murugadass-Periard/base:=bitbucket.org:acerolla32
Murugadass-Periard/directory:=periard-murugadass
Murugadass-Periard/pre:=
Murugadass-Periard/post:=
#


update: $(patsubst %,update/%,$(GROUPES))


update/%:
	if [ ! -d $(*) ] ; then \
		mkdir $(*) ; \
	fi
	-if [ ! -d $(*)/$($(*)/directory) ] ; then \
		cd $(*) ; git clone git@$($(*)/base)/$($(*)/directory).git ; \
	else \
		cd $(*)/$($(*)/directory) ; \
		git pull ; \
	fi

check-log: $(patsubst %,check-log/%,$(GROUPES))

check-log/%:
	cd $(*)/$($(*)/directory) ; \
	git log | less

correction: $(patsubst %,correction/%,$(GROUPES))

correction/%:
	evince "$(*)/$($(*)/directory)/$($(*)/pre)" &
	 evince "$(*)/$($(*)/directory)/$($(*)/post)" & 
	( cd $(*)/$($(*)/directory) ; xterm & )
	@echo "appuyez sur entrée pour passer au suivant"
	@read input

