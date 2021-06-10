#!/bin/bash
g++-8 -c foo.cpp -fprofile-arcs -ftest-coverage --std=c++14 -o foo.compiled
g++-8 -c main.cpp -fprofile-arcs -ftest-coverage --std=c++14 -o main.compiled
g++-8 -o foo_binary foo.compiled main.compiled -fprofile-arcs -ftest-coverage --std=c++14 
lcov --no-external --capture --initial --directory . --output-file baseline.info
g++-8 -o main_test -fprofile-arcs -ftest-coverage --std=c++14 foo_test.cpp foo.cpp
./main_test
lcov --no-external --capture --directory . --output-file after_test.info
lcov --add-tracefile baseline.info --add-tracefile after_test.info --output-file final_lcov.info
genhtml --ignore-errors source final_lcov.info --legend --title "check if enum appears" --output-directory=genhtml_output

