#Copy implemented hooks 
for file in `ls -1 VoColClient/Hooks`
do
 if [ $file != "InstallHooks" ]; then
   cp VoColClient/Hooks/$file .git/hooks/$file
   echo "Please write your admin password to allow execute permission for hook "$file
   sudo chmod +x .git/hooks/$file
 fi
done

#Ignore tools folder using .gitignore
if [ ! -e ".gitignore" ]; then
  touch .gitignore
  echo "VoColClient/" >> .gitignore
else
  if ! grep -q "VoColClient" ".gitignore"; then
   echo "VoColClient/" >> .gitignore
  fi
fi
