vagrant box add ./img_jam.box ubuntu/jam
git clone https://github.com/richifor/ex
cd ex
echo -e "./id_rsa\n\n"|ssh-keygen -t rsa -b 4096
chown vagrant:vagrant id_rs*
vagrant up
mv ansiblemachine1.sh ansiblemachine1.sh.old
mv ansiblemachine2.sh ansiblemachine1.sh
mv dockermachine1.sh dockermachine1.sh.old
mv dockermachine2.sh dockermachine1.sh

vagrant provision 
