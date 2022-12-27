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