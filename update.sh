ifn=$1

if [ $# -eq 0 ]
then
	echo "No arguments supplied. Usage: >update myfile.txt"
	exit
fi

#TODO: how to check for which folder? search and present all as choices?
cp $1
