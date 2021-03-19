'###############VBS Start###############
Dim strOld, strNew, dFolder, expDataType
' set paths in the following way:
' [DRIVE]:\[DIR]\[SUB_DIR]\
dFolder = "C:\temp\" 
' set the data-type (like .txt or .csv)
expDataType = ".csv"
' this string
strOld = ""
' will be replaced with this string
strNew = ""
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
