#!/usr/bin/bash
shopt -s extglob
export LC_COLLATE=C
echo "*-----------------------------*"
echo "|   Welcome to Myk&O DBMS     |"
echo "*-----------------------------*"
function Main_Menu() {
  select m in "CreateDB" "ListDB" "ConnectToDB" "DropDB" "Exit"; do
    case $m in
    CreateDB)
    . createDB.sh
      ;;
    ListDB)
    . listDB.sh
      ;;
    ConnectToDB)
      while true; do
        echo "Choose a DB to use: "
        ls -F | grep /
        read ans
        if [[ -d $ans ]]; then
          cd $ans
          echo "you are now using $ans Database"
          echo "Choose from the following options: "
          function Main_Table_Menu() {
            select n in "CreateTable" "ListTable" "DropTable" "InsertTable" "SelectFromTable" "DeleteFromTable" "UpdateTable" "Exit"; do
              case $n in
              CreateTable)
                . createTable.sh
                ;;
              ListTable)
                ls
                ;;
              DropTable)
                . dropTable.sh
                ;;
              InsertTable)
                . insertTable.sh
                ;;
              SelectFromTable)
                . selectFromTable.sh
                ;;
              DeleteFromTable) 
              . deleteFromTable.sh
              ;;
              UpdateTable)
              . updateTable.sh
                ;;
                Exit)
                exit
                ;;
              *)
                echo "Invalid Option"
                ;;
              esac
            done
          }
          Main_Table_Menu
        else
          echo "DB doesn't exist"
        fi
      done
      ;;
    DropDB)
      . dropDB.sh
      ;;
    Exit)
      exit
      ;;
    *)
      echo "Invalid Option"
      ;;
    esac
  done
}
Main_Menu
