#openssl sha1 hash breaker
#Need the -n argument with echo to remove the newline that is appended to the end
#rockyou.txt is the name of the file containing the words to test
#if you don't have a text file you can use the list in /usr/share/dict/words

username="4a3ff2a69d3a6bc0cc8eebae2e7bcfbcfc8ba25"
password="89ac7d0e2cdfc986b8dc77c19fe7f4e4e8e2c804"
#John->2829f395317df0f88597ef288f132827794707af
#password->c8fed00eb2e87f1cee8e90ebbe870c190ac3848c
#username="2829f395317df0f88597ef288f132827794707af"
#password="c8fed00eb2e87f1cee8e90ebbe870c190ac3848c"

while read NAME
do
	if [ "$username" == "$(echo -n $NAME | openssl sha1)" ]; then
		echo "$NAME matches with username"
		echo "$NAME matches with username" >> found.txt
	fi
	if [ "$password" == "$(echo -n $NAME | openssl sha1)" ]; then
		echo "$NAME matches with password"
		echo "$NAME matches with password" >> found.txt
	fi
done < rockyou.txt
#done < numbers.txt
#done < john.txt
#done < /usr/share/dict/words
