#!/bin/bash
mkdir ./linux_practice
cd ./linux_practice
mkdir ./name
mkdir ./permission
cd ./name
touch file1.txt 
touch file2.txt
cd ../permission
touch file3.txt
touch file4.txt

cd ../name
rm file1.txt
mv file2.txt show.txt
echo 'Hello linux' >> ./show.txt
cat show.txt

cd ../permission
chmod 644 ./file3.txt 
chmod 644 ./file4.txt 



