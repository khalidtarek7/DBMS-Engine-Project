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