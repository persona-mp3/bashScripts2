#read -p  "ENTER PASSWORD"
#echo "yourpassword" | sudo -S apt password

echo "INITIALISE GIT REPO"
echo ""


echo "Hit Ctrl+c to quit..."
read -p  "Enter y/n to continue..." choice

echo ""


echo "You chose: $choice"
sleep 1

echo "background processing..."


# this runs the git init command in the current working dir
gitInit=$(git init)

if [ "$choice" = "y" ]; then
	echo ""

	echo "$gitInit"
	
	echo ""
	echo "Adding all changes"
	
	echo ""
	sleep 1
	
	echo "$(git add .)"

	echo ""
	read -p "Enter commit messge --> " commitMsg
	#read -p "Enter remote name --> " remoteName
	
	echo ""

	sleep 1
	
	echo "$(git commit -m "$commitMsg")"
	
	echo ""
	read -p  "git log updated, would you like to push to remote repo ? " gitPush
	


	if [ "$gitPush" == "y" ]; then 
		echo ""
		read -p "Enter name of repository --> " repoName
		
		echo "connecting to github api..."

		sleep 1

		echo ""
		read -p "Github username --> " userName
		sleep 1

		echo "$(curl -u "$userName" https://api.github.com/user/repos -d '{"name": "'$repoName'"}')"
		# the github api will request for the password automatically and verify
		
		echo ""
		echo "pushing to remote repo at --> $repoName..."
		echo "setting upstream to master..."
		
		echo ""
		sleep 2

		echo "$(git remote add origin https://github.com/persona-mp3/$repoName.git)"
		echo "$(git push --set-upstream origin master)"
		echo "done."
	fi
fi


	
