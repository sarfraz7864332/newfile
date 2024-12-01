#!/bin/bash 

#variable
echo "enter the Url: "
read a
tmp=/tmp/webdoc
url=$a

service=apache2

#debugging
set -x  #debugging 
set -e  #to exit if any error 

#script starts from here

echo "starting webload script"
echo "#########################################################"
echo "creating tmp file"
echo
mkdir -p $tmp 
echo "done"
echo
echo "downloading artifact"
echo
if [ -e $tmp/*]
then 
rm -rf $tmp/*
fi
cd $tmp
wget $url
unzip *.zip
echo
echo "removing previus html file"
echo
echo "loading atrifact in httpd service"
echo
if [ -e /var/www/html/*]
rm -r /var/www/html/*
then 
fi
filename=$(ls $tmp| grep -v *.zip)
echo $filename
cp -r $tmp/$filename/* /var/www/html/
echo "done"
systemctl restart $service
echo 
echo "####################################################"
ifconfig | grep inet | sed -n '2p'
echo "#####################################################"


