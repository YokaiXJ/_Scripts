'###############VBS Start###############
Dim strFilePath, strOld, strNew

' the first variable will be the read file
' the second varieble will be the output file
' if both variables are the same, the read file 
' will be overwritten
strReadFilePath = "C:\temp\test.txt"
strWriteFilePath = "C:\temp\test.txt"
' this string
strOld = ""
' will be replaced with this string
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

