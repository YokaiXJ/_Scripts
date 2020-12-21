@echo off

cd C:\Users\Rodenburgerj\source\repos\_Scripts

git add .

git commit -m "_Scripts Mayor Changes | %date% - %time%"

git push origin master

echo Press Enter...

timeout /t 5