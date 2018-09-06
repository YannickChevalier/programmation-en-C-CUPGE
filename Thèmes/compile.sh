#! /bin/bash

prefix=tp
modules="enonces solutions"
tex_name=`find . -name '*'$1'*.tex' -print`
echo ${tex_name}
base_name=$(basename ${tex_name} .tex)
echo ${base_name}
base_name=${base_name#${prefix}}
echo ${base_name}
dest_dir=$(pwd)
cd ..
for module in ${modules} ; do 
    make -f complet.mk ${dest_dir}/${prefix}-${module}-${base_name}.pdf
done

