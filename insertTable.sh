echo "Available tables : "
                ls -F
                read -p "Enter table Name: " insertb

                if [[ -f $insertb ]]; then
                  typeset -i colno=$(awk -F"|" '{if(NR==1){print NF}}' $insertb)

                  for ((i = 1; i <= $colno; i++)); do
                    colname=$(awk -F"|" -v"i=$i" '{if(NR==1){print $i}}' $insertb)
                    coltype=$(awk -F"|" -v"i=$i" '{if(NR==1){print $i}}' $insertb)

                    while true; do
                      read -p "Enter $colname " value

                    # if [[ $coltype == "int" && $value =~ ^[0-9]$ || $coltype = "string" && $value =~ ^[a-z|A-Z]+$ ]]; then

                          if [[ $i != $colno ]]; then

                            echo -n $value"|" >>$insertb
                            echo "Value 1 Added!"
                            break
                          else
                            echo $value >>$insertb
                            echo "Value 2 Added!"
                            break
                          fi

                      # else
                      #   echo "invalid value!"
                      # fi

                        done

                      done

                    

                    else

                      echo "$insertb doesn't exist"
                    fi

                Main_Table_Menu