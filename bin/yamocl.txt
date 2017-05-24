15. Noyau
cat /etc/modules
modinfo <modulename>
rmmod <modulename>
lsmod

4. Disque
sudo fdisk -l
du -a /home/yamo/backup/ | sort -n -r | head -n 10
sudo dosfsck -t -a -v /dev/sdb1

10. Réseau
ssh-keygen -t rsa -C "yamo93@gmail.com"
nslookup google.com #Teste le serveur dns
telnet talk.google.com 5222
ifconfig wlan0 down
hciconfig hci0 down;rmmod hci_usb

6. Sauvegarde
sudo dd if=/dev/sda of=~/mbr.img bs=512 count=63 #Procédure de sauvegarde du MBR
sudo dd if=~/mbr.img of=/dev/sda bs=446 count=1 #Pour restaurer le MBR sans restaurer la table de partition (par exemple si Windows a écrasé votre menu Grub), saisissez dans un terminal:
sudo dd if=~/mbr.img of=/dev/sda bs=512 count=1 #Pour restaurer le MBR et la table de partition (par exemple en cas d'erreur lors du partitionnement du disque), saisissez dans un terminal:
sudo dd if=~/mbr.img of=/dev/sda bs=1 skip=446 seek=446 count=66 #Pour ne restaurer que la table de partition (par exemple en cas d'erreur lors du partitionnement du disque et si l'on désire garder le bootloader que l'on a pu modifier), saisissez dans un terminal:

8. Installation
dpkg --get-selections|grep
dpkg -l|grep linux|cut -f 3 -d " "
dpkg -s firefox # status : fonctionne uniquement si le package est installé
dpkg-reconfigure hddtemp (daemon at startup ?)
apt-get update
apt-get upgrade
apt-get install
apt-cache search firefox
add-apt-repository ppa:x/y

y. Materiel
lsusb #Liste les périphériques USB
lspci #Liste les périphériques PCI
lspci -v
lspci|grep VGA
ls /media #Liste les périphériques amovibles montés
lshw -C network

x.git
git config --global user.name "Yann Moisan"
git config --global user.email "yamo93@gmail.com"
git remote add origin git@github.com:YannMoisan/math.git
git push -u origin master
git log --oneline --graph
git rebase --interactive HEAD~2 #pour fusionner 2 commit

ex command
:s/&amp;/\&gt;/g
:20,24s/.*/    <li>&<\/li>/
:3,5s#^\s*<span class="\(.*\)">\(.*\)</span>#\1=\2#
:%s/(ctrl-v)(ctrl-m)//g // remove ^M
:w ! sudo tee % # Save changes in Vim even if you forgot to sudo
%s/\([0-9]\{2\}\).\([0-9]\{2\}\).\([0-9]\{2\}\).\([0-9]\{2\}\).\([0-9]\{2\}\)/\1.\2.\3.\4.\5 # regexp adress book

cd - # Se positionne dans le précédent répertoire de travail
cp filename{,.bak} # shell extension
convmv -f cp1252 -t utf-8 -r .
cat tmp.sh >> blog.sh #concatene 2 fichiers

find backupDvd/photos/ -name "*.[aA][vV][iI]" -ls|wc -l
find backupDvd/photos/ -name "*.[aA][vV][iI]" -ls|awk '{T+=$7} END {print T}'
find / -type f -size +20000k -exec ls
find . -type f|sed 's/.*\.//'|sort|uniq # Liste les extensions de fichiers
find . -type d \( -name "CVS" -o -name ".svn" \)
find backupDvd/photos/ -name "*.[aA][vV][iI]" -ls|wc -l
find backupDvd/photos/ -name "*.[aA][vV][iI]" -ls|awk '{T+=$7} END {print T}'
find backup/application/ -size +1000k -ls
find . -name entry*.html | xargs sed -i '4i-----'
find . -name entry*.html | xargs sed -i '3,5s#^\s*<span class=(.*)>\(.*\)</span>#\1=\2#'
find . -name entry*.html | xargs sed -i '1,2d'
find src -name entry*html|xargs sed -i '1,4s/^/$/' #ajoute le caractère $ aux 4 premières lignes

time ls -al
exiftool "-Directory<DateTimeOriginal" -d "%Y-%m-%d" .

/etc/hostname
/etc/hosts
/etc/resolv.conf
/etc/network/interfaces

grub-install -v

which eclipse
whereis eclipse
locate eclipse

!! #dernière commande
!$ #dernier argument

echo "!n" > file # sav a command in the history in a file
sudo ln -s /opt/apache-maven-3.0.3/bin/mvn /usr/bin/mvn
grep -lir /usr/share/tomcat7 ~/workspace2/.metadata/
. .profile
mvn archetype:generate -DarchetypeGroupId=fr.gouv.impots.appli.commun.manzana.maven.archetypes -DarchetypeArtifactId=archetype-META -DarchetypeVersion=3.0 -DarchetypeRepository=http://repo.appli.dgfip/nexus/content/repositories/public
usermod -G nogroup damien Attention, sans l'option -a, enleve les droit root
mysqldump -u root -p bk_trunk
mount -t vboxsf share shared
sudo update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_04/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_04/bin/javac 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
. ~/.bashrc
grant all privileges on inside.* to bluekiwi
etc/udev/rules.d/70-persistent*net
ifconfig eth0 192.168.10.125 netmask 255.255.255.0
route add default gw 192.168.10.1
readlink
readlink -e /usr/bin/java
namei /usr/bin/java
./mahout seq2sparse -i ~/Downloads/space_sequencefile -o ~/output -ow
./mahout kmeans -i ~/output/tfidf-vectors/ -c initialclusters -o outputclusters --maxIter 100 -k 20
./mahout clusterdump -dt sequencefile -d ~/output/dictionary.file-0 -s outputclusters/clusters-1/ -b 10 -n 10
./mahout seqdumper --seqFile ~/Downloads/space_sequencefile 
./mahout vectordump --seqFile ~/output/tfidf-vectors/part-r-00000 -dt sequencefile -d ~/output/dictionary.file-0 
./mahout kmeans -i ~/output/tfidf-vectors/ -c initialclusters -o outputclusters --maxIter 100 -k 20 --clustering
./mahout seq2sparse -i ~/Downloads/space_sequencefile -o ~/output -ow -nv
./mahout seqdumper --seqFile outputclusters/clusteredPoints/part-m-00000 | sed -n 's/Key: \([0-9]*\).*vec: SPACE_\([0-9]*\).*$/\1,\2/p' > cluster.txt
The current script's pid is 12509, the pid of the last background process is 
sudo usermod -a -G vboxusers yamo
/opt/hadoop-1.0.2/bin/hadoop fs -put /data/client/clustering/client_extractor_user.bk /user/yamo/data/client/clustering
/opt/hadoop-1.0.2/bin/hadoop fs -mkdir /data/client/clustering
sudo fdisk -l lister les partitions
find /home/test -printf "%s:%p\n"|sort -k1n|tail -50 50 plus gros fichiers
find
find . -name *.sbt -exec grep -l assembly {} \;
find . -name *.sbt -exec grep -l assembly {} \;
find . -name *.sbt -exec grep -l assembly {} \;
command $(!!) #for output of last command, need to reexcute it
xrdb -query -all
dig google.com
ulimit -s
find . -name target|xargs du -sh|sort -h
find ./dev/projects/progfun/funsets/target
pacman -S ttf-inconsolata
timedatectl status
timedatectl set-time '2013-02-12 14:45:00'
setxkbmap -layout fr -variant oss
cat /etc/shells
mysql -u root wine < src/main/resources/cellar.sql
cat /usr/share/tmux/
tput colors
C-b : source-file ~/.tmux.conf
tmux attach -t 0
git config -l
logname
echo 1000
rsync -a --no-o --no-g --delete --progress /mnt/data/backup/photos/2012 /mnt/freebox/Photos/
find /mnt/data/backup/photos/ -name .xvpics -type d -exec find '{}' -type f \; | wc -l
find /mnt/data/backup/photos/ -type f -name *.* | sed -e 's/.*\.//' | sort | uniq -c | sort -nr
find /mnt/data/backup/photos/ -type f -name *.* | sed -e 's/.*\.//' | sort | uniq -c | sort -nr
git remote set-url origin git@github.com:YannMoisan/dotfiles.git
netcfg -u ethernet-dhcp
systemctl start mysqld.service
curl -XPOST localhost:9200/index-attach -d mapping.json 
curl -XPOST localhost:9200/index-attach -d mapping.json 
mkdir -p ~/.config/wmfs && cp /etc/xdg/wmfs/wmfsrc ~/.config/wmfs
fc-list
su - : change rep courant, recharge variable d'env, .bash_profile
su -c 'command' = sudo command
su - = sudo -i
ssh -l user server = ssh user@server
arp-scan -I enp4s0 -l
find . -type f -printf %s
