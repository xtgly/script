Const forwriting=2
Const forreading=1
Dim oFSO,oF,r1,s
Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oF = oFSO.CreateTextFile("hardware.htm")
Set oShell = WScript.CreateObject("WScript.Shell")
oshell.run ("%comspec% /c if exist c:\\temp.txt del /q c:\\temp.txt"),0,True
oshell.run("%comspec% /c dir /b/n *.txt >>c:\\temp.txt"),0,True
oF.WriteLine "<html>"
oF.WriteLine "<head>"
oF.WriteLine "<title>Ó²¼þ¼ì²â±¨¸æ</title>"
oF.WriteLine "</head>"
oF.WriteLine "<body>"
oF.WriteLine "<center><h1><font color=red>Ó²¼þ¼ì²â±¨¸æ</font></h1>" &VbCrLf
oF.WriteLine "<table frame=border>"
oF.WriteLine "<tr align=center>"
oF.WriteLine "<td>»úºÅ</td>"
oF.WriteLine "<td>Ö÷°å</td>"
oF.WriteLine "<td>CPU</td>"
oF.WriteLine "<td>ÄÚ´æ</td>"
oF.WriteLine "<td>Ó²ÅÌ</td>"
oF.WriteLine "<td>ÏÔ¿¨</td>"
oF.WriteLine "<td>Íø¿¨</td>"
oF.WriteLine "</tr>"
Set objFSO1 = CreateObject("Scripting.FileSystemObject")
Set objTextFile1 = objFSO1.OpenTextFile _
    ("c:\\temp.txt", ForReading)
objTextFile1.ReadAll
line=objTextFile1.line
for l=1 to line-1

Set objFSO = CreateObject("Scripting.FileSystemObject") 
Set objTextFile = objFSO.OpenTextFile("c:\\temp.txt", ForReading)
For i=1 to l
r1=objTextFile.ReadLine 
next

of.writeline "<tr align=center>"
of.writeline "<td>"
of.writeline left(r1,len(r1)-4)
of.writeline "</td>"

Set fso = CreateObject("Scripting.FileSystemObject")
set f = fso.OpenTextFile(r1, Forreading)
for i=1 to 6
of.writeline "<td>"
f.skip(3)
r=f.readline
oF.WriteLine r
of.writeline "</td>"
next
next
of.writeline "</tr>"
oF.WriteLine "</table>"
oF.WriteLine "</body>"
oF.WriteLine "</html>"
