echo "Available tables : "
                ls -F
                read -p "Enter table Name: " SelectedTable

                if [[ -f $SelectedTable ]]; then
                  typeset -i colno=$(awk -F"|" '{if(NR==1){print NF}}' $SelectedTable)
                  echo "Choose the type of selection: "
                  select TypeOfSelect in "SelectAllFromTable" "SelectSpecificColumn"; do
                    case $TypeOfSelect in
                    SelectAllFromTable)
                      cat $SelectedTable
                      ;;
                    SelectSpecificColumn)
                      
                      for ((i = 1; i <= $colno; i++)); do
                        read -p "Enter the column name: " colname

                        echo "Here is what you want!"
                        cut -d "|" -f $i $SelectedTable

                      done
                      ;;
                    *)
                      echo "Invalid option"
                      ;;
                    esac
                  done
                else
                  echo "Table doesn't exist"
                fi