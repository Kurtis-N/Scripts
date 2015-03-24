#openssl sha1 hash breaker
#Need the -n argument with echo to remove the newline that is appended to the end
#rockyou.txt is the name of the file containing the words to test
#if you don't have a text file you can use the list in /usr/share/dict/words
#easily modifiable to use md5 or another hash in openssl by substituing the sha1 argument for md5 or other hash.

#John->5753a498f025464d72e088a9d5d6e872592d5f91
#password->c8fed00eb2e87f1cee8e90ebbe870c190ac3848c
username="5753a498f025464d72e088a9d5d6e872592d5f91"
password="5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"

foundUsername=false
foundPassword=false

while read NAME
do
	if [ "$username" == "$(echo -n $NAME | openssl sha1)" ]; then
		echo "$NAME matches with username"
		echo "$NAME matches with username" >> found.txt
		foundUsername=true
	fi
	if [ "$password" == "$(echo -n $NAME | openssl sha1)" ]; then
		echo "$NAME matches with password"
		echo "$NAME matches with password" >> found.txt
		foundPassword=true
	fi
	if [ \( "$foundUsername" = true \) -a \( "$foundPassword" = true \) ]; then
		echo complete 
		break
	fi
done < rockyou.txt
#done < numbers.txt
#done < john.txt
#done < /usr/share/dict/words
