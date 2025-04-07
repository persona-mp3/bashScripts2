echo "INTIALISE NEW REPO"
echo "enter Ctrl+C/n to terminate this script"

echo ""

read -p "Enter y/n to continue --> " choice


if [ "$choice" == "n" ]; then 
    echo "Process terminated"
    echo "$(Ctrl+C)"


fi 



if [ "$choice" == "y" ]; then 
  echo "initialising new git repo in current direcory...."

  sleep 1

  echo ""
  echo "$(git init)"

  echo "adding all changes"
  echo ""

  echo "$(git add .)"
  echo ""

  sleep 1

  
  read -p "Enter commit message --> " commitMsg

  echo ""
  echo "$(git commit -m "$commitMsg")"

  echo ""
  read -p "initaling new repository... " 

  echo ""
  read -p "What would you like to call the name the repo ? --> " repoName
  
  sleep 1
  echo ""
  read -p "Enter your account username --> " userName
  
  echo "connecting to github api..."
  sleep 1

  responseBody=$(mktemp)

  apiResponse=$(curl -s -u "$userName" https://api.github.com/user/repos -d '{"name" : "$repoName"}' -w '%http_code' -o "$responseBody")

  
  echo "USE THE TOKEN GIVEN TO YOU BY GITHUB AS YOUR PASSWORD WILL NOT WORK"
  
  if [ "$apiResponse" -ne 201 ]; then 

    echo "An error occured"
    echo "$(cat "$responseBody")"


  else 
    echo "Created successfully"
    echo ""

    echo "pushing to remote repo...."
    sleep 1

    echo ""
    echo "$(git remote add origin https://github.com/persona-mp3/"$repoName".git)"
    echo "$(git push origin master)"
  fi

fi
