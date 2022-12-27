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
                          echo "Do you want to put a key on your column?"
                          select colkey in "Yes" "No"; do
                            case $colkey in
                            Yes)
                              colkey="PrimaryKey"
                              break
                              ;;
                            No)
                              echo "No key added!"
                              break
                              ;;
                            *)
                              exit
                              ;;
                            esac
                          done

                          if [[ i -eq $colno ]]; then
                            echo -n "$colname : $coltype" >>$TableName
                          elif [[ i -eq 1 ]]; then
                            echo -n "$colname : $coltype : $colkey | " >>$TableName
                          else
                            echo -n "$colname : $coltype | " >>$TableName
                          fi
                        done
                        echo -e >>$TableName
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