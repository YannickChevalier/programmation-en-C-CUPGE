#! /bin/bash

prefix=tp
modules="enonces solutions"
titres="EntréesSorties Git Tableaux Types"


function tex_compile () {
    tex_names=( `find . -name '*'$1'*.tex' -print`)
    tex_name=${tex_names[0]}
    echo "Fichier trouvé: ${tex_name}"
    base_name=$(basename ${tex_name} .tex)
    echo ${base_name}
    base_name=${base_name#${prefix}}
    echo ${base_name}
    dest_dir=$(pwd)
    cd ..
    for module in ${modules}
    do 
	make -f complet.mk ${dest_dir}/${prefix}-${module}-${base_name}.pdf
    done
}


if [[ $# -ne 1 ]]
then
    for titre in $titres
    do
	( tex_compile $titre )
    done
else
    tex_compile $1
fi


