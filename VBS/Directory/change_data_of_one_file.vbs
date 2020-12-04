'###############VBS Start###############
' Variablen hier bitte anpassen
Dim strFilePath, strOld, strNew

' die 1. variable entspricht der datei die eingelesen wird
' die 2. variable enspricht der ausgabedatei
' wenn beide variablen gleich sind, wird die 
' angegebende datei einfach überschrieben
strReadFilePath = "C:\temp\test.txt"
strWriteFilePath = "C:\temp\test.txt"

' diesen string
strOld = ""

' ersetzen durch diesen string
strNew = ""

'###############VBS Start###############
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strReadFilePath, 1)
strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, strOld, strNew)
set resultFile = objFSO.CreateTextFile(strWriteFilePath, true)
resultFile.WriteLine strNewText
resultFile.Close
'###############VBS ENDE################

