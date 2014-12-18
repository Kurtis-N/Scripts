#in ~/.bash_profile put
#alias decrypt=/Users/kurtisniedling/Dev/scripts/decrypt.sh
ifn=$1
ext="${1##*.}"
ofn="${1%.*}"

if [ $ext == "aes" ]
then
	echo "decrypting $ifn to $ofn"
	openssl aes-256-ecb -d -salt -in $ifn -out $ofn
	#ensure successful command before removing old file
	if [ $? -eq 0 ]; then
		echo OK
		srm $1
	else
	        echo "failed to decrypt file"
	fi
else
	echo "files need to be *.aes encryped..not decrypting"
fi
