!#/usr/bin/bash
echo Hello, world

number=1
echo $number

state="Ontario"
echo $state

expr 5 + 2

let number=$number+1
echo $number

echo "Script arguments: $@"
echo "Number of arguments: $#"
echo "Third argument: $3"

echo "Type something"
read response
echo "You entered: $response"

true
echo $?

true && echo "Program 1 was executed"
false && echo "program 2 was executed"

true || echo "Program 1 was executed"
false || echo "Program 2 was executed"

[[ 4 -gt 3 ]]
echo "Exit status of 4 > 3: $?"

[[ 3 -gt 4 ]]
echo "Exit status of 3 > 4: $?"

file="./code/Rbasics.R"
[[ -e $file ]]
echo "The existence status of file Rbasics.R is: $?"



echo -n "Enter the first number: "
read VAR1
echo -n "Enter the second number: "
read VAR2
echo -n "Enter the third number: "
read VAR3

if [[ $VAR1 -ge $VAR2 ]]
then
  if [[ $VAR1 -ge $VAR3 ]]
  then
    echo "$VAR1 is the largest number."
  else
    echo "$VAR3 is the largest number."
  fi
else
  if [[ $VAR2 -ge $VAR3 ]]
  then 
    echo "$VAR2 is the largest number."
  else
    echo "$VAR3 is the largest number."
  fi
fi


