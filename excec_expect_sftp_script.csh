#!/bin/csh -v
#################################
### Autor: Alejandro Horsmann ###
#########20/12/2023##############
###### SETEO DE VARIABLES########

set today = `date "+%d"`
set now = `date "+%Y%m%d%H%M"`
set proc = exce_expect_sftp_script
set dirhome = `pwd`
set log = $dirhome/$proc

set file1 = prefix$today
set file2 = prefix$today
set file3 = prefix$today
set file4 = prefix$today
set file5 = prefix$today
set file6 = prefix$today

echo $today
echo $now
echo $file1
echo $file2
echo $file3
echo $file4
echo $file5
echo $file6
echo $dirhome
echo $log
echo $letr_A
echo $letr_B
echo $letr_C
cd $dirhome
echo '### Exec script expect ###'
expect $proc.exp
ls $file1
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR DOWNLOADING  $file1                     ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 1
endif
ls $file2
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR DOWNLOADING $file2                      ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 2
endif
ls $file3
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR DOWNLOADING $file3                      ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 3
endif
ls $file4
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR DOWNLOADING $file4                     ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 4
endif
ls $file5
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR DOWNLOADING $file5                      ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 5
endif
ls $file6
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#####ERROR AL DESCARGAR $file6                     ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 6
endif
