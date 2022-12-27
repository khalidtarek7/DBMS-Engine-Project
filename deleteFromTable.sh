echo "Available tables : "
                ls -F
                read -p "Enter table Name: " TableToBeDeleted
                cat $TableToBeDeleted
                
                echo "Now you are going in the vi mode to edit the file and delete whatever you want, follow these instructions: "
                echo "1- Press i to enter the insert mode and then delete the value you want"
                echo "2- Press ESC to exit the insert mode and type :wq to save and exit."
                echo "Please confirm by pressing 1 or exit by pressing 2"
                select confirmation in "Yes" "No" ; do
                  case $confirmation in
                  Yes)
                  vi $TableToBeDeleted
                  echo "Ok! Here is the updated file:"
                  cat $TableToBeDeleted
                  ;;
                  No)
                  exit
                  ;;
                  *)
                  echo "Invalid Option!"
                  ;;
                  esac
                done