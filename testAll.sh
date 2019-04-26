#!/bin/bash

# Rebuild the parser from the source files.
make clean
make

# Delete preexisting machine source files.
rm machines/M*

# Generate the state machine files using the parser.
# I am well aware of the inefficiencies of including needless
# machines in the output files - this is a quick/dirty solution
# to the issue of input files containing multiple machines.
./Parser < test/M1.fsm > machines/M1.cpp
./Parser < test/M1.fsm > machines/M2.cpp
./Parser < test/M3.fsm > machines/M3.cpp
./Parser < test/M3.fsm > machines/M4.cpp
./Parser < test/M3.fsm > machines/M5.cpp
./Parser < test/M3.fsm > machines/M6.cpp
./Parser < test/M7.fsm > machines/M7.cpp
./Parser < test/M8.fsm > machines/M8.cpp
./Parser < test/M9.fsm > machines/M9.cpp
./Parser < test/M9.fsm > machines/M10.cpp
./Parser < test/M11.fsm > machines/M11.cpp
./Parser < test/M11.fsm > machines/M12.cpp
./Parser < test/M11.fsm > machines/M13.cpp
./Parser < test/M11.fsm > machines/M14.cpp
./Parser < test/M11.fsm > machines/M15.cpp
./Parser < test/M11.fsm > machines/M16.cpp
./Parser < test/M11.fsm > machines/M17.cpp
./Parser < test/M11.fsm > machines/M18.cpp
./Parser < test/M11.fsm > machines/M19.cpp
./Parser < test/M11.fsm > machines/M20.cpp


# Run the tests.
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do
    echo "Testing Machine $i";
    ./testOne.sh $i
    echo
done

# Delete build artifacts.
make clean
