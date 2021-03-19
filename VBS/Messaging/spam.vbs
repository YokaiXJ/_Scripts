set shell = createobject ("wscript.shell")
strtext = inputbox ("The message that should be send")
strtimes = inputbox ("Times the message should be send")
strtdelay = inputbox ("Delay between messages in ms")

if not isnumeric(strtimes) then
    wscript.quit
end if

msgbox "You have 10 seconds to click into the msg box of your textinput after pressing [OK]"

wscript.sleep( 10000 )

for i=1 to strtimes
    shell.sendkeys(strtext & "{enter}")
    wscript.sleep(strdelay)
next