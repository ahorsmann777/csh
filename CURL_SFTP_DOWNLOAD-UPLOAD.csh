#!/bin/csh
##################################
# Author: Alejandro Horsmann ######
#28/01/2024#######################

###### variables ########

set proc = CURL_SFTP_DOWNLOAD-UPLOAD
set dirhome = `pwd`
set log = $dirhome/$proc.$1.log
set remote_file = name_of_the_file_to_download 
set day = `date "+%d%m%y"`
set rhost = 10.0.0.1 ### set your remote host
set sftpint = ### set the sftpint server ip
set user = user ### set the user from remote host
set password = password ### ser your password
set your_user = `whoami`
set rhome = /home/$user/Escritorio/
## use this variable if you don't need to set the file from a list ### 
set file1 = file_to_download ### name of the remote file
set credentials = {$user}:{$password}

echo "==========> today is $day <========= "
echo "====>the local path is $dirhome <======"
echo "=====> the remote host is $rhost <=========="


echo "<======================= starting proces $proc  ===============================>"
cd $dirhome
##### uncomment the folowing lines if you need to get a list of the files ####
#echo "<========== listing files on $rhost ===================>"
#curl --insecure "sftp://$rhost:22/home_folder/sub_folder/" --user $credentials -o $dirhome/files_list.txt
#if ($status != 0) then
#        echo "        ========> ERROR GENERATING LIST  <=======    " >> $log
#		date >> $log
#        cat $log
#        exit 1
#endif
##### uncomment the folowing lines if you need to get as list of files ######################
#echo "==================> geting name of the file to download today $day <======================"
#set file1 = `grep prefix$day'\w*' files_list.txt | awk '{print substr($0, length($0)-11)}'`
#if ($status != 0) then
#        echo "        ========> ERROR AL OBTENER EL NOMBRE DEL ARCHIVO <=======    " >> $log
#		date >> $log
#        cat $log
#        exit 2
#endif
echo "<============  $file1 ================>"

echo "<============ downloading  $file1 from $rhost ================>"
curl --insecure "sftp://{$rhost}:22{$rhome}"$file1 --user $credentials -o $dirhome/$file1
if ($status != 0) then
        echo "        ========> ERROR DOWNLOADING $file1 <=======    " >> $log
		date >> $log
        cat $log
        exit 3
endif
echo "<================ $file1 Downloaded succefully ====================>"

echo "<============================================== step 2, moving file to the internal sftp ======================================================>"
echo "<================== copying $file1 to sftpint ====================>"
echo "LEAVING $file1 in SFTPINT" >> $log
set ipt = $proc.InputFile.txt
echo "cd /home/$user/Documentos/" >> $ipt
echo "put $file1 vuelta_$file1" >> $ipt
echo "bye" >> $ipt
sftp -b $ipt $user@$sftpint
if ($status != 0) then
        echo "=============> ERROR UPLOASDING $file1 SFTPINT <=============" >> $log
        date >> $log
        cat $log
        exit 4
endif
rm $ipt

echo "<====  end of the proces $proc =======>"
