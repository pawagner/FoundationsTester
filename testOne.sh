#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Incorrect number of arguments.  Please provide machine number.";
    exit 1;
fi

classfilename="machines/M$1.cpp"
driverfilename=""
inputfilename="inputs/M$1.txt"

if [[ $1 -ge 10 ]]
then
    driverfilename="drivers/Driver$1.cpp"
else
    driverfilename="drivers/Driver0$1.cpp"
fi

if [ ! -f $classfilename ]
then
    echo "file $classfilename not found." 
    exit 1;
fi

if [ ! -f $driverfilename ]
then
    echo "file $driverfilename not found."
    exit 1;
fi

g++ $driverfilename $classfilename -o testexe
./testexe < $inputfilename > testout.txt

goodlines=$(grep -c Good testout.txt)
badlines=$(grep -c Bad testout.txt)

echo "Expecting 999 Good lines... Found: $goodlines"
echo "Expecting 1 Bad line... Found: $badlines"

rm testexe
rm testout.txt
