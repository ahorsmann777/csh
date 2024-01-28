#!/bin/csh
##############################
#Author: Alejandro Horsmaann #
#v1.0 11/011/2023 ############
##############################

cd ~
set proc = enumeration
set now = `date "+%d%m%Y%H%M%S"`
set user = `whoami`
set ip = $1
set name = $2
#set dirhome = /home/$user/Documentos/CTF/$name
set dirhome = `pwd`
set log = $dirhome/$user/$name/$proc$now.log

echo "<========  creating destination  folder ========>"
mkdir $dirhome/Documentos/CTF/$name
cd $dirhome/Documentos/CTF/$name
echo "<======== Starting enumeration... this will take few minutes, be patient ============>"
nmap -p- -sV --min-rate 10000 $1 > nmap1.log
if ($status != 0) then
    echo "==========> NMAP1 ERROR <===========" >> $log
    exit 1
endif
grep -l "80/tcp" nmap1.log
if ($status == 0) then
    # http found, let's run gobuster - this script only check if there is service runing on port 80"
      goto gobuster
else
    echo "=========> there is no http server <=========="
    goto next
endif

gobuster:
echo "<============== gobuster execution for http://$1/ =======================>"
gobuster dir -u http://$1/ -w /usr/share/wordlists/directory-list-2.3-medium.txt -x php,html,txt,js,png,jpg,jpeg,bak,bkp > gobuster.log
echo "<================= gobuster execution end ===============================>"
echo "<================= searching web vulnerabilitys using nikto =============="
nikto -h $ip
if ($status == 0) then
	echo  "==============> Error in nikto´s execution <====================="
endif
echo "<================= nikto executiond end =================================>"
echo "smb" >> nmap1.log
grep -l "smb" nmap1.log
if ($status == 0) then
    # smb found, let's run enum4linux "
     goto enum4linux
else
     echo "=========> there is no smb in server <=========="
     goto next
endif

enum4linux:
perl /home/alex/Documentos/tools/enum4linux/enum4linux.pl -a $1 > enum4linux.log

next:
echo "<==========  enumeration for $1 complete, check de results in $dirhome ======>"
