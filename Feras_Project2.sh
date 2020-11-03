#!/bin/bash
##Author: Feras 
##Project 2
###I used a Fedora live boot for this project. Also used the home directory to extract the tar file  and create the other files.

##Task 1
#cd to home directory
cd ~

#mkdir a dir names log
mkdir log

#extract the tar file
tar xf wrapper.log.tar.gz --directory log

#cat .log and regex for ip, LOGIN, failed, mymathworks, nacmpa, and store it into failed-login.txt
cat log/wrapper.log | egrep 'LOGIN' | egrep 'failed' | egrep '([0-9]{1,3}\.){3}([0-9]{1,3})' | egrep -v 'mymathworks|nacmpa' > failed-login.txt

#word count for failed-login.txt and store it in count-failed-login.txt
wc -l failed-login.txt > count-failed-login.txt

##Task 2
#cat .log and regex for 'allowed to relay', 'support@tomcathostingservice.com', and store it in must-be-empty.txt
cat log/wrapper.log | egrep 'allowed\sto\srelay' | egrep -v 'support@tomcathostingservice.com' > must-be-empty.txt
