#!/bin/csh

## Seteo de Variables #####################################################################
set proc = reparo_vbox
set dirhome = `pwd`
set log = $dirhome/$proc
###########################################################################################
echo "<===============Inicia script Reparo error de modprobe vboxdrv ====================>"

echo "<===== Ejecuto apt update previamente =================>"
sudo apt update
if ($status != 0) then
        echo '                                                     ' > $log
        echo '#####################################################' >> $log
        echo '#    ERROR AL ACTUALIZAR REPOSITORIOS              ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 1
endif
echo "<================ paso 1: reinstalo virtualbox-dkms ================>"
sudo apt install --reinstall virtualbox-dkms
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#     ERROR AL REINSTALAR virtualbox-dkms          ##' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 2
endif
echo "<=================== Instalo build-esentials y dkms necesariios para reconstruir el módulo ==================>"
sudo apt-get install build-essential dkms linux-headers-$(uname -r)
if ($status != 0) then
        echo '                                                     ' >> $log
        echo '#####################################################' >> $log
        echo '#  ERROR AL REINSTALAR build-esentials y dkms       #' >> $log
        echo '#####################################################' >> $log
        echo '                                                     ' >> $log
        date >> $log
        cat $log
        exit 3
endif
sudo apt install linux-headers-$(uname -r)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 /path/to/MOK.priv /path/to/MOK.der $(modinfo -n vboxdrv)

echo "<====================== La ejecucion finalizo correctamente, por favor reinicie el equipo =====================>"
