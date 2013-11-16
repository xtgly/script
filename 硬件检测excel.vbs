Const forwriting=2
Const forreading=1
Dim oFSO,oF,r1,s
Set oFSO = CreateObject("Scripting.FileSystemObject")

Set oShell = WScript.CreateObject("WScript.Shell")
oshell.run ("%comspec% /c if exist c:\\temp.txt del /q c:\\temp.txt"),0,True
oshell.run ("%comspec% /c if exist c:\\excel.csv del /q c:\\excel.csv"),0,True
oshell.run("%comspec% /c dir /b/n *.txt >>c:\\temp.txt"),0,True


Set oF = oFSO.CreateTextFile("c:\\excel.csv")
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

file=left(r1,len(r1)-4)&","
Set fso = CreateObject("Scripting.FileSystemObject")
set f = fso.OpenTextFile(r1, Forreading)

for i=1 to 6
f.skip(3)
r=f.readline
file=file & r &","
next

of.writeline file
next


oshell.run("c:\\excel.csv"),0,True
