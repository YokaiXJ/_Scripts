'###############VBS Start###############
Dim strOld, strNew, dFolder, expDataType

' Bitte den letzten Backslash mit auflisten
dFolder = "C:\Users\Jannek\source\repos\_Scripte\VBS\Directory\" 
' Hier die Dateiendung angeben
expDataType = ".txt"
' Diesen string
strOld = "JANNEK"
' ersetzen durch diesen string
strNew = " 123456 "

'###############VBS Start###############
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set oFolder = objFSO.GetFolder(dFolder)
For Each oFile In oFOlder.Files
If InStr(oFile, expDataType) > 0 Then
Set objFile = objFSO.OpenTextFile(oFile, 1)
strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, strOld, strNew)
set resultFile = objFSO.CreateTextFile(oFile, true)
resultFile.WriteLine strNewText
resultFile.Close
End If
Next
'###############VBS ENDE################