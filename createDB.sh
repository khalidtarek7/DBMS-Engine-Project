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