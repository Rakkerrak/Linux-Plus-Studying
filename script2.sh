#!/bin/bash
echo "shebang (#!) marks the start of the script and tells what program will execute the script"
echo "/bin/bash is referencing bash.  This script will run in bash, not dash, zsh, or another shell."
read -p "Press ENTER  along the way and the script will continue"
echo "Commonting: Anything following a # on the same line will not be run as code.  Except the shebang of course because it's special."
#Hahaha you can only see this inside of the script.

#These read -p " " allow the script to flow at a desirable pace for the reader.
#I don't think they're on the test. -p means prompt (so you can add text) and read allows for user input (which is put into $REPLY since I have not specified a variable name.)
read -p " "
echo "Sourcing scripts: Allows you to have functions in multiple files.  If you're familiar with other languages, it's like import, include, or require. Syntax:"
echo " source /path/to/script" 
echo ". /path/to/script"
echo "these can be relative or absolute(?) paths and provide reusability and orgnaization"
read -p " "


echo "Permissions: Don't forget to add executable to any script you create and be mindful of who can execute it."


read -p " " 
echo "extensions: more for easy usability. Linux doesn't care what you call it but in two weeks, you'll be glad you can tell why the .sh files are versus the .txt"
read -p " "
echo "File Globbing:"
echo "I'm going to make some files real fast"
echo "Making ./bonk ./book ./beak"
touch book bonk beak
ls 
echo "See, there they are. Now I'll use >ls bo*:"
read -p " "
ls bo*
echo "It returned both because the * is a wildcard that matches zero or any instances of the previous character."
read -p " "
echo "When you use ?, it will replace a single character with any character.  So if I use ls bo?k..."
read -p " "
ls bo?k
echo "...It will return book and bonk since they both follow the pattern.  If there was a boook, it would not return it, but bo*k would. Watch:"
read -p " "
echo "touch boook"
touch boook
ls
echo ls bo\*k
ls bo*k
echo ls bo\?k
ls bo?k
echo rm boook
rm boook
ls
read -p " "
echo "Next up  is []. Think of it like an 'or' box. If I run >ls b[oe]* I get..."
read -p " "
ls b[oe]*
echo "...all three because it will display anything that follows b[o] or b[e]." 
echo "For an example without * because ls b* would do the same thing really, I'll try >ls b[oe][ao]k"
read -p " "
ls b[oe][ao]k
echo "We don't get bonk because no [n] was specified."

read -p " "
echo "For more fun, you can also use ranges: ls bo[a-z]k for example:"
ls bo[a-z]k
echo "will pick up o and n since they're between a and z."
read -p " "
echo "Shell expansions: Parameter expansion \${}"
echo "{} by itself seems to function similarly to [], just using commas and accepting multiple characters([oa] vs {o,a}. And it can accept b{oo,on}k.  The test specifically mentioned \${} which is a different thing."
echo "It allows you to set a variable and use it at the same time."
echo "echo \${var2=:\"variable\"}"
read -p " "
echo ${var2:="variable"}
#This is a function. You can ignore it. It's not on the test. It just lets me circulate the reponse for invalid input.

echo " "
iffunct() {
	read -p "Would you like to learn a little extra that may or may not be on the test?(y/n)" hello
#	echo "$hello"
	if [[ $hello == "y" ]] #Use [[]] for string comparisons!!
	then
		echo "\${!name*} is called indirect expansion. Let's create some variables:"
		echo "var1=value1; var2=value2; var3=value3"
		var1=value1; var2=value2; var3=value3
		#notice we're using ; to string three commands together.
		read -p " "
		echo "Let's have a look and make sure they've been created:"
		echo "echo \$var1 \$var2 \$var3"
		read -p " "
		echo $var1 $var2 $var3
		echo "Now we can use \${!var*} to see them all:"
		echo "echo \${!var*}"
		read -p " "
		echo ${!var*}
		echo "There they are!"
		read -p " "
		echo "Going a bit further, \${!name} without the wildcard also seems to be called indirect expansion, but it performs a different function.  It lets you go another level deep, so to speak, with your variables.  It's pretty cool. Watch!"
		echo "First we need another level.  We have var1=value1"
		echo "But let's add another layer and create variables for value[123]:"
		echo "value1=exvalue1; value2=exvalue2; value3=exvalue3"
		value1=exvalue1; value2=exvalue2; value3=exvalue3
		read -p " "
		echo "Checking that they're there:"
		echo "echo \$value1 \$value2 \$value3"
		read -p " "
		echo $value1 $value2 $value3	
		echo "So to recap, we have var?=value? and value?=exvalue?, but I can call var? and completely skip over value? to get to exvalue?!"
		echo "echo \${!var1} \${!var2) \${var3}"
		read -p " "
		echo ${!var1} ${!var2} ${var3}
		echo "Ok. That about does it for this weird \${!} stuff. Let's move on!"
	elif [[ $hello == "n" ]]
	then
		echo "All right. Continuing on
"
	else
		echo "Hmm. That's not a valid response. Please try again"
		iffunct		
	fi
}
#calling the function. It won't run unless you call it of course.
iffunct

echo "
Let's pause for a second and talk about if statements. I just used one to create that response prompt above! (also a function but ignore that >.> )"
echo " IF you pressed y, THEN it did something. ELse IF you pressed n, THEN it did something different. ELSE neither was picked, if told you that the input was invalid."
echo "Bash loves its backwards. So you finish it off with a fi at the end(get it, if->fi?)"
echo "Because the script is pretty long, here's a summary of a full if statement:"
read -p " "
echo "if [[ \$response == \"y\" ]] #this is [[string comparison]] syntax!
then
	do command1
elif [[ \$response == \"n\" ]]
then
	do command2
else
	echo \"Hey you gotta choose y/n!\"
fi
"
read -p " "
echo "Watch out for those spaces! Syntax matters."
read -p " "
echo "Since we're on the subject, case statements work similarly.  They're shorter, but not as robust as if statements can be"
read -p " "
echo "case \$response in
	y)
		command 
		;;
	n)
		command
		command 
		;;
	*)
		Invalid! 
		;;
esac
"
read -p " "
echo "Notice it's quirks.  case -> esac and the ;; that lets the case statement know it's at the end of that option.  Also, the * wildcard catches other inputs, like the else does for if.  Let's try and write a case statement here.  Go into the script to find it.  The variable I use will be called \$fruit."

casefunct() {
	read -p "What's your favorite fruit?" fruit
	case $fruit in
		#these accept globs. so I can account for upper and lowercase
		[aA]pple) echo "I love those! Crunch!" ;;
		[Oo]range) echo "Oooh those are coming into season soon!" ;;
		*berry | *berries) echo "Wow good taste!" ;;
		*) echo "There's so many fruits! They're all pretty great." ;;
	esac
	read -p "Want to try again?(Press n for no, otherwise it'll go again)" try
	case $try in
		n) echo "Enough with fruit. Back to Shell expansion" ;;
		*) casefunct ;;
	esac	
}
casefunct
read -p " "
echo "We took a break for a second but let's get back to shell expansions, specifically \$(command) or \`command\`, otherwise known as Command Substitution!"
echo "Basically, it runs the command inside the parentheses or backticks(yes, \` is a backtick not an apostrophe).  Why is this useful?  Well, you can now echo the output of a command or even set the output equal to a variable.  Let's try echoing:"
echo "If I echo date, it just says date:"
read -p " "
echo "echo date" 
read -p " "
echo date
read -p " "
echo "That's not the date! But command substitution will use the date command and show us the date"
echo "echo \$(date)"
read -p " " 
echo $(date)
echo "There's a lot of cool uses for this. Just know that it will run the command and use whatever the output is"
read -p " "
echo "I'm not sure how to relate these to exit codes but here:
name		code		what it is
stdin		0		standard input: keyboard, mouse, etc
stdout		1		standard output: output of command
stderr		2		standard error: any errors(permissions, not found, etc)
"
read -p " "
echo "Redirection: You can redirect stdout and stderr to files using #> or #>>. If you would like to redirect both, use &> or &>>"
echo "For bonus points and because this guy said it was important on Youtube: If you slap 2>&1 to the end of your redirection, It will send stderr to wherever stdout is going."
echo "So, 
cat my.txt > your.txt 2>\$1 
will put either the file contents or the error into your.txt, depending on if you can cat the file. If you manage to cat the file and get an output, both will end up in the file."
read -p " "
echo "Piping: You can use the pipe | to pipe  the output of one command to another."
echo "And you can use '| tee ' or '| tee -a' to output to tee(a command) which will output to a file and the screen. I'm counting this as piperedirection! Since tee is listed in objective 2.3 under redirectors."
read -p " "
echo "There's a ton of exit codes. The number can be from 0-255.  Basically, it's a value that describes the success or failure of the previous command. You can use them in return statements in a function, but that can get a little hairy."
echo "You can view this value with echo \$? Like so.  First run a command"
read -p " "
echo "echo  \"This echo will run successfully\" "
read -p " "
echo "\$?"
read -p " "
echo $?
#look I know that the $? is running off of a different command but just go with it for the illusion ok?
echo " "
echo "0 Means a success. Some others are here:
0 	success
1	general error
2	misuse of command
127	command not found
130	terminated with Ctrl+C
"
read -p " "
echo "You can set these in your script, but they'll be overwritten if you use any other command, so be careful!"
read -p " "
echo "Metacharacters: Characters that do things other than exist. The backslash\\ for example is an escape character.  > >> $ & \` and such are all metacharacters."
echo "Be careful when using them in a script. For example if I want to say I owe you \$100, I must escape that \$ with the backslash or it will call a variable that doens't exist.  Look in the script to confirm that's what I did."
echo "Google will probably do you well for a list of metacharacters. Some are listed in Linux+ objective 2.3. as well"
read -p " "
echo "Escaping Characters: We already touched on \\, but there are a couple others. \" \" for example negates most characters. "
echo 'Single quotes(apostrophes) negate all metacharacters, even $ and \'
echo "If you check the script, there's no \\ there other than what you read onscreen because I used \' \'."
echo "That sounds wonderful, but you can no longer use variables or commands in your echo statements and you have to be very careful of words with apostrophes because they will mark the end of your string prematurely."
read -p " "
echo "Positional Parameters: When you run a shell script that can take inputs(arguments in the command line), those inputs are stored as variables automatically."
echo "If I write a script about fruit, let's say, and it goes:
./fruit orange
A variable will be created automatically:
1=orange
You can then use this variable in your script normally with \$1."
read -p " "
echo "Scriptfile contents:
#!/bin/bash
echo \$1"
echo "will output: 
orange 
when called with the above ./script.sh orange"
read -p " "
echo "Last but not least we have loops!"
read -p " "
echo "While Loops: A continuous loop that goes while a condition is met. It can go on forever if you forget to make sure the condition is reachable!"
echo "Let's write a script to count the days until New Years!"
read -p " "
echo "
#!/bin/bash


#setting our variables
Today=1
NewYears=31

#-lt is less than.
while [ \$Today -lt \$NewYears ]  #while loop syntax [] allow us to compare two things.
do
        echo -n \"Not yet...\"    #-n takes out the newline.
        ((Today++))             #make sure you count up for each day.
done
echo \"Happy New Years!\"         #the loop exits on 31 and prints Happy New Year"
#error error go away come again aneverday
read -p " "
echo "Now we'll execute that."

#setting our variables
Today=1
NewYears=31

#-lt is less than.
while [ $Today -lt $NewYears ]  #while loop syntax [] allow us to compare two things.
do
        echo -n "Not yet..."    #-n takes out the newline.
        ((Today++))             #make sure you count up for each day.
done
echo "Happy New Years!"         #the loop exits on 31 and prints Happy New Year

read -p " "
echo "Great!"
echo "Until Loop: They're very similar.  They will go until a certain condition is met. So, the while loop ran while the today was not the 31st.  Let's make an until loop that will run until the date equals the 31st."
read -p " "
echo "
#!/bin/bash
#setting our variables.
Today=1
NewYears=31

# -eq is used for checking if two integers are equal.
until [ \$Today -eq \$NewYears ]          #Will exit the loop when Today=31
do
        echo -n \"Not yet...\"
        Today=\$[ \$Today + 1 ]           #Another way to iterate up by 1
done
echo \"Happy New Years!\"
"
read -p " "
echo "Now executing our until loop:"
read -p " "
#setting our variables.
Today=1
NewYears=31

# -eq is used for checking if two integers are equal.
until [ $Today -eq $NewYears ]          #Will exit the loop when Today=31
do
        echo -n "Not yet..."
        Today=$[ $Today + 1 ]           #Another way to iterate up by 1
done
echo "Happy New Years!"

echo "Note that both of these use a do -> done format.  Don't forget them!  It's od that they didn't use the backwards convention, but I'm sure there some really nice Linux Lore as to why not."
#Did you catch my pun? :D
#Also that's not sarcastic. There's so many cool stories in Linux history.

read -p " "
echo "That about covers it for the scripting.  If you'll notice I didn't cover the first section of objective 5.1.  It's easier to explain at the end."
echo ""
echo "PATH is an environment variable that can be set by anything that sets your bash settings.  I'm talking about /etc/profile, ~/.profile and all of those."
echo "It contains all the directories that will be looked through to find a command."
echo "Other important environment variables inclue PWD, HOME, ID, and LOGNAME.  To check for all of them, you can find them a few ways."
read -p " "
echo "First and simplest is printenv. I won't run the whole thing, but we know PATH is a variable, so let's look for that."
read -p " "
echo "printenv | grep PATH"
read -p " "
printenv | grep PATH
read -p " "
echo "env has a bit more functionality.  It can set environment variables as well.  You should chec it's manpage but for now, we can also use it to grep PATH:"
read -p " "
echo "env | grep PATH"
read -p " "
env | grep PATH
read -p " "
echo "And then there's set.  It's more complicated.  Just running set, its output contains not only all Environment Variables, but also any functions that are being used in your shell (remember those setting files!)"
echo "If we use the same format, you can see some pieces of those functions:"
read -p " "
echo "set | grep PATH"
read -p " "
set | grep PATH
echo "If you don't see it, try running it in another terminal."
read -p " "
echo "It can do other things as well.  It can unset variables similar to env, but it has in-script function that can be really valuable."
echo "It can be really useful for debugging scripts. -x for example will list every command run before it runs. -u and -e will stop a script if a variable(u) or command(e) is not found." #which would have been super useful for debugging this let me tell you!
echo "There's likely more to it and who knows how much comptia actually cares about.  Here's a handy article though:
https://www.tutorialdocs.com/article/set-command-in-bash.html
"
read -p " "
echo "Lastly! And intentionally lastly, let's look at global and local variables."
echo "For posterity, this entire script is echo statements and I've talked about how it deals with metacharacters and escaping characters above. Also with variables and path."
read -p " "
echo "Ahem. Local and Global. Right. When creating a variable in the commandline or a script, you have to make sure that you know what can see your variable."
echo "For example, any variable created in this bash script is local to this instance of a shell.  It can't easily be exported back into the original shell you ran this script from, but it can be exported to subshells created by this script."
read -p " "
echo "In the commandline, all you need to do to prove this is to run the following:"
echo "var4=4; echo \$var4
bash 
echo \$var4"
read -p " "
echo "var4 won't report being anything after you're in your subshell."
echo "You can use export to make sure it shows up in a subshell.  As far as I can tell, this doesn't work backwards.  You can't export back up to a parent.  Anyhow, try this:"
echo "
var5=5; echo \$var5
export var5
bash
echo \$var5
"
read -p " "
echo "Now it should show up!  The shorter version and more common way of teaching export is:
export var5=5
"
read -p " "
echo "Sometimes in scripting(though I can't find an exmaple right now and when I do I'll add it @.@) you create a subshell without realizing it and poof!  All your variables are temporarily gone.  Check for this if a script is behaving strangely, and remember that neat set function that helps with debugging missing variables!"
echo "To sum it up, local variables stay in your shell, you can move them to being global(and all your child shells can see them) with export, and none of these are permenant until you add them to a bash config file that sets your environment variables."
echo "I think that's it.  Have a poke around this monster, make good use of / in vim to search, and good luck!"
