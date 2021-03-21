#! /bin/bash

files=( $( ls -a . ) )
echo $files
echo ${#files[@]}
exc=( . .. symlink.sh )

for target in $exc; do
    i=1
    for file in $files; do
        # echo $i
        # echo "${file} = ${target}"
        if [[ $file = $target ]]; then
            echo ${files[i]}
            unset 'files[i]'
        fi
        let "i++"
    done
done

for file in $files
do
    echo $file
done

while true; do
    read -p "Are you sure? [Y/n]" yn
    if [[ $yn != "y" ]] && [[ $yn != "n" ]];then
        yn=y
    fi
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
    esac
done

