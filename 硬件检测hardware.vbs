'本脚本的功能是检测硬件的信息。
On Error Resume Next
temp=0
set wshshell=wscript.createobject("wscript.shell")
'启动WMI服务
wshshell.run ("%comspec% /c regsvr32 /s scrrun.dll"),0,True
wshshell.run ("%comspec% /c sc config  winmgmt start= auto"),0,True
wshshell.run ("%comspec% /c net start winmgmt"),0
'用一个文本来记录硬件信息
Set WshNetwork = WScript.Createobject("WScript.Network")
computername=WshNetwork.ComputerName

set fso=createobject("scripting.filesystemobject")
tempfilter="\\192.168.0.250\hard_info\"& computername &".txt"
'\\game\ps$\是服务器存放配件表的位置。共享要完全享
set tempfile=fso.createtextfile(tempfilter)

strComputer = "."
Set objWMIService = Getobject("winmgmts:\\" & strComputer & "\root\cimv2")
'主板
set board =objwmiservice.execQuery("select * from win32_baseboard")
for each item in board
board2="主板:" & item.Product
next
'CPU
set cpu =objwmiservice.execQuery("select * from win32_processor")
for each item in cpu
cpu2= "CPU:" & item.Name
next
'内存
Set colItems = objWMIService.ExecQuery("Select * from Win32_PhysicalMemory",,48)
For Each objItem in colItems
a=objitem.capacity/1048576
temp=temp+objitem.capacity
n=n+1
Next
memory=temp/1048576
if n=1 then
memory2= "内存: " & n & "条" &a&"M"
else
memory2= "内存: " & n & "条" &a&"M"&" 总计"&memory&"M"
end if
'硬盘
set disk =objwmiservice.execQuery("select * from win32_diskdrive")
for each item in disk
    disk2= "硬盘: " &  item.Model
next

'显卡
set video =objwmiservice.execQuery("select * from win32_videocontroller",,48)
for each item in video
  video2= "显卡: " & item.Description
next
'网卡
set network =objwmiservice.execQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True")
for each item in network
lan="网卡:" & item.description
next
tempfile.writeline(lan)

tempfile.writeline(board2)
tempfile.writeline(cpu2)
tempfile.writeline(memory2)
tempfile.writeline(disk2)
tempfile.writeline(video2)

tempfile.writeline(lan2)


