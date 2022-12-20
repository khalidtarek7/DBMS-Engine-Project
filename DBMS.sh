#!/usr/bin/bash
<<<<<<< HEAD
shopt -s extglob
export LC_COLLATE=C
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
if [[ $ans =~ ^[a-z|A-Z]+$ && ! -d $ans ]] ; then
mkdir $ans
echo $ans "DB created successfully"
break
else
echo "table already exists"
echo "error: Typo"
fi
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
ls -F | grep /
read ans
if [[ -d $ans ]] ; then
cd $ans
echo "you are now using $ans Database"
echo "Choose from the following options: "
select n in "CreateTable" "ListTable" "DropTable"
do
case $n in
CreateTable)
while true
do
read -p "Enter table name: " name
if [[ $name =~ ^[a-z|A-Z]+$ ]] ; then
if [[ -f $name ]] ; then
echo "Table already exists, choose another name"
else
touch $name
echo "Table created"
fi
else
echo "Typo error"
fi
break
done
;;
ListTable)
read -p "enter table you want to list: " name
if [[ -f $name ]] ; then
echo "good! here is the table: " 
cat $name
else
echo "table doesn't exist"
fi
;;
DropTable)
read -p "enter table you want to drop: " name
echo "table deleted!"
rm $name
;;
*)
echo "Invalid Option"
esac
done
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
rm -r $ans
echo "$ans DB deleted successfully"
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
