GROUPES:= \
	Amiel-Combelles \
	ArnauldDesLions-Prouvost \
	Bouhier-BaselgaColas \
	Buissiere-Girres \
	CadeauCompte-Guitard \
	Carrie-Hamdani \
	Cathala-PongLoi \
	ElRifai \
	Gonthier-Kwan \
	Murugadass-Periard
#
Amiel-Combelles/base:=bitbucket.org:amielcombelles
Amiel-Combelles/directory:=projet
#
ArnauldDesLions-Prouvost/base:=bitbucket.org-ychevali:MilkyW4y
ArnauldDesLions-Prouvost/directory:=prouvost-arnaulddeslions
#
Bouhier-BaselgaColas/base:=bitbucket.org:lucabc
Bouhier-BaselgaColas/directory:=bouhier-baselga-colas
#
Buissiere-Girres/base:=bitbucket.org:malobp
Buissiere-Girres/directory:=projet-buissiere-girres
#
CadeauCompte-Guitard/base:=bitbucket.org:ancadeau
CadeauCompte-Guitard/directory:=guitard-cadeau
# 
Carrie-Hamdani/base:=bitbucket.org:dalalhamdani
Carrie-Hamdani/directory:=carrie-hamdani
#
Cathala-PongLoi/base:=bitbucket.org-ychevali:pldarren
Cathala-PongLoi/directory:=pong_loi-cathala
#
ElRifai/base:= github.com:omarwaddah
ElRifai/directory:=proj
#
Gonthier-Kwan/base:=github.com:LuguyGonthier
Gonthier-Kwan/directory:=projet
#
Murugadass-Periard/base:=bitbucket.org:acerolla32
Murugadass-Periard/directory:=periard-murugadass
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
