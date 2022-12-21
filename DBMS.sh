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
      while true; do
        echo "Enter database name?"
        read ans
        if [[ $ans =~ ^[a-z|A-Z]+$ && ! -d $ans ]]; then
          mkdir $ans
          echo $ans "DB created successfully, back to the main menu: "
          break
        else
          echo "error: Typo"
        fi
      done
      ;;
    ListDB)
      echo "Available Databases are:"
      ls -F | grep /
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
            select n in "CreateTable" "ListTable" "DropTable" "InsertTable" "SelectFromTable" "DeleteFromTable" "UpdateTable"; do
              case $n in
              CreateTable)
                while true; do
                  read -p "Enter table name: " TableName
                  if [[ $TableName =~ ^[a-z|A-Z]+$ && ! -f $TableName ]]; then
                    touch $TableName
                    while true; do
                      read -p "How many columns do you want in the table? " colno
                      if [[ $colno =~ ^[0-9]$ ]]; then
                        for ((i = 1; i <= colno; i++)); do
                          read -p "Enter column number $i name: " colname
                          echo "Choose a data type for column number $i from the following options: "
                          select coltype in "int" "string"; do
                            case $coltype in
                            int)
                              coltype="int"
                              break
                              ;;
                            string)
                              coltype="string"
                              break
                              ;;
                            *)
                              echo "invalid choice, pick again "
                              ;;
                            esac
                          done
                          if [[ i -eq $colno ]]; then
                            echo -n "$colname : $coltype" >>$TableName
                          elif [[ i -eq 1 ]]; then
                            echo -n "$colname : $coltype : " "PrimaryKey | " >>$TableName
                          else
                            echo -n "$colname : $coltype |" >>$TableName
                          fi
                        done
                        echo "$TableName has been created!"
                        break
                        Main_Table_Menu
                      else
                        echo "its not a number"
                      fi
                    done
                  else
                    echo "Table already exists or there is a typo error"
                  fi
                done
                Main_Table_Menu
                ;;
              ListTable)
                ls
                ;;
              DropTable)
                ls
                while true; do
                  read -p "enter table you want to drop: " name
                  if [[ -f $name ]]; then
                    rm $name
                    echo "table $name deleted!"
                    break
                  else
                    echo "There is no such table!"
                  fi
                done
                ;;
              InsertTable) ;;

              SelectFromTable) ;;

              DeleteFromTable) ;;

              UpdateTable) ;;

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
      while true; do
        echo "which DB do you want to delete?"
        ls -F | grep /
        echo "Type the database you want to delete: "
        read ans
        if [[ $ans =~ ^[a-z|A-Z]+$ && -d $ans ]]; then
          echo "Are you sure? (Y/N)"
          read answer
          if [[ $answer = "Y" ]]; then
            rm -r $ans
            echo "$ans DB deleted successfully"
            break
            Main_Menu
          else
            echo "Ok! back to the main menu!"
            echo "Choose from the following options: "
            Main_Menu
          fi
          break
        else
          echo "error: not a database"
        fi
      done
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
