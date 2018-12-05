#!/bin/bash
#
# This script was created for Assignment 7 (crypters) for the SLAE course
# This is a combined tool for encryption or decryption with openssl
# JMM (SLAE Student ID 1363)
# December 2018
# Real quick, let's check for previous files
#
if [ -f encryptedsc.txt ]; then
	echo "[+] File encryptedsc.txt exists!"
	echo "[+] Select an option"
	echo "1: Overwrite with new encrypted shellcode"
	echo "2: Rename the first file and proceed"
	echo "3: Decrypt and exit"
	echo "4: Exit"
	read -p "[+] Select an option " option
	if [ "$option" = 1 ]
	then
		echo "[+] Removing previous file"
		/bin/rm encryptedsc.txt
	elif [ "$option" = 2 ] 
	then
		read -p "Enter the new file name to preserve your previously encrypted shellcode " newname
		/bin/cp encryptedsc.txt $newname
		/bin/rm encryptedsc.txt
		echo "[+] Previously encrypted file renamed!"
		echo "[+} Proceeding"
	elif [ "$option" = 3 ]
	then
		# We will verify the cipher is correct, decrypt and exit
		echo "[+] The cipher entered was $2"
		read -p  "[+] Is this correct? (yes or no) " verifycipher
		if [ $verifycipher = "no" ]
		then
			read -p "[+] Enter the correct cipher " decryptcipher
		else
			echo "[+] Decrypting with provided cipher"
			decryptcipher=$2
		fi
		read -p "[+] Enter the key! " key
		if 
			openssl enc -$decryptcipher -d -k $key -in encryptedsc.txt
		then
			echo "[+] Completed decrypting shellcode!"
			echo "[+] If you cannot read, you entered the wrong key!"
			echo "[+] Exiting ..."
			exit
		else
			echo "[+] There was a problem with the passphrase or cipher"
			echo "[+] Exiting"
			exit
		fi
	else
		echo "[+] You either entered 4 or an invalid value"
		echo "[+] Exiting"
		exit
	fi 
else
   echo "No soup for you!" >/dev/null
fi
sleep 2
#
# Once here, we are committed to decrypting
# Checking the script has two arguements
#
if [ $# != 2 ]
then 
	echo "[+] Missing or excessive argument(s)!"
	echo "[+] Usage : shellencrypt filename cipher"
	exit
fi
#
# Using the famous Command Line Fu objdump command to extract shellcode from the compiled program
#
echo "[+] extracting shellcode from $1 and creating a file"
objdump -d ./$1 |grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g' | tee unencryptsc.txt
sleep 1
echo "[+] Use openssl to encrypt with $2 cipher"
#
# Combine openssl with if-then-else
# TY @Chapworthy
#
if
	openssl enc -$2 -in unencryptsc.txt -out encryptedsc.txt
then
	echo "[+] Encrypted file created encryptedsc.txt"
	echo "[+] Done!"
else
	echo "[+] There was an error with the openssl cipher or password"
fi
exit
