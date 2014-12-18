#in ~/.bash_profile put
#alias encrypt=/Users/kurtisniedling/Dev/scripts/encrypt.sh
ifn=$1
#ext="${1##*.}"
ofn="$1.aes"

#check for args
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit
fi

#ensure successful execution before removing old file
openssl aes-256-ecb -salt -in $ifn -out $ofn
if [ $? -eq 0 ]; then
    echo OK
    srm $1
else
	echo "failed to encrypt"
fi
