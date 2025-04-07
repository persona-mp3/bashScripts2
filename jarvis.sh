name=$1

sleep 2

echo "/n"

echo "Welcome $name"
sleep 3
echo "Loading protocols..."

sleep 3

echo "All systems intact, how would you like to begin ? "

homeDir=$(cd ~/Desktop  && ls)


echo "What directory would you like to go into?"

echo "$homeDir"

sleep 2

read target


