#!/usr/bin/bash
echo "*-----------------------------*"
echo "|   Welcome to Myk&O DBMS     |"
echo "*-----------------------------*"
select m in "CreateDB" "ListDB" "ConnectToDB" "DropDB" "Exit"
do
case $m in
CreateDB)
while true
do
echo "Enter database name?"
read ans
if [[ $ans =~ [a-zA-Z0-9] ]] ; then
mkdir $ans
echo $ans "DB created successfully"
else
echo "error: Typo"
fi
break
done
;;
ListDB)
echo "Available Databases are:"
ls -F | grep /
;;
ConnectToDB)
echo "Choose a DB to use"
read ans
if [[ -d $ans ]] ; then
cd $ans
else
echo "DB doesn't exist"
fi
;;
DropDB)
echo "which DB do you want to delete?"
read ans
if [[ -d $ans ]] ; then
echo "Are you sure? (Y/N)"
read answer
if [[ $answer = "Y" ]] ; then
rmdir $ans
else
cd $ans
echo "Ok! You are now using $ans DB"
fi
else
echo "error"
fi
;;
Exit)
exit
;;
* )
echo "Invalid Option"
esac
done
