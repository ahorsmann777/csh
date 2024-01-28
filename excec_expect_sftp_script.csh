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
set letr_A = A
set letr_B = B
set letr_C = C
set letr_D = D
set letr_E = E
set letr_S = S
set file1 = prefix$today$letr_A.338
set file2 = prefix$today$letr_B.338
set file3 = prefix$today$letr_C.338
set file4 = prefix$today$letr_E.338
set file5 = prefix$today$letr_S.338
set file6 = prefix$today$letr_D.338

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
