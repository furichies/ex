#!/bin/bash
#A ver como tira en windows
vagrant box add ubuntu/jam ./img_jam.box 
echo "agregada la imagen ubuntu/jam"
sleep 1
if [ ! -d ./ex ]
then 
 git clone https://github.com/richifor/ex
fi
echo "entendemos que existe ex y debe estar clonado"
sleep 1
cd ex

vagrant up
echo "entendemos que la cosa ha tirado. Renombramos ficheros para aprovisionar"
sleep 1
mv ansiblemachine1.sh ansiblemachine1.sh.old
mv ansiblemachine2.sh ansiblemachine1.sh
mv dockermachine1.sh dockermachine1.sh.old
mv dockermachine2.sh dockermachine1.sh
echo " a ver si tira el último aprovisionamiento"
sleep 1

vagrant provision 
