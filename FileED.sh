#!/bin/bash

echo "----------Welcome to File Encrypter/Decrypter---------"
echo "Please choose the option: "
choice="Encrypt Decrypt Exit"

function isFileValid(){
	if [ -e $1 ] ; then
		return 0
	else
		return 1
	fi
}

select option in $choice; do
	if [ $REPLY = 1 ]; then
		echo "You have chosen to Encrypt the file."
		echo "Please Enter the File name: "
		read file1;

		if [ isFileValid $file1 ];then		
			gpg -c $file1
			echo "File has been encrypted successfully."
		else
			echo "File is invalid."
		fi

	elif [ $REPLY = 2 ];then
		echo "You have chosen to Decrypt the file."
		echo "Please Enter the File name: "
		read file2;

		if [ isFileValid $file2 ]; then
			gpg -d $file2
			echo "File has been decrypted successfully."
		else
			echo "File is invalid."
		fi
	else
	exit
fi
done

