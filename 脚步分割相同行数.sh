#!/bin/sh
linenum=`wc -l logfile.log |awk '{print $1}'`
Num1=1
FileNum=1
while [ $Num1 -lt $linenum ]; do
    Num2=`expr $Num1 + 1999`
    sed -n "${Num1},${Num2}p" logfile.log > SplitFile$FileNum  
    Num1=`expr $Num2 + 1`
    FileNum=`expr $FileNum + 1`
done