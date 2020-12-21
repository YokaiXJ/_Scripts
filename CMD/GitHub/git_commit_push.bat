@echo off

set path="c:\temp"
set msg="Mayor Changes"

cd %path%

git add .

git commit -m "%msg% | %date% - %time%"

git push origin master

echo Press Enter...

timeout /t 5