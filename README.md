# Lcov examples

### enum example - Goal

Is an enum defined in a header file considered as instrumented in lcov calculation?

### Run the example

Ran using ``lcov 1.15``, `g++- 8.4.0`, and the `.lcovrc` commited here.

````
g++-8 -c foo.cpp -fprofile-arcs -ftest-coverage --std=c++14 -o foo.compiled
g++-8 -c main.cpp -fprofile-arcs -ftest-coverage --std=c++14 -o main.compiled
g++-8 -o foo_binary foo.compiled main.compiled -fprofile-arcs -ftest-coverage --std=c++14 
lcov --no-external --capture --initial --directory . --output-file baseline.info
g++-8 -o main_test -fprofile-arcs -ftest-coverage --std=c++14 foo_test.cpp foo.cpp
./main_test
lcov --no-external --capture --directory . --output-file after_test.info
lcov --add-tracefile baseline.info --add-tracefile after_test.info --output-file final_lcov.info
genhtml --ignore-errors source final_lcov.info --legend --title "check if enum appears" --output-directory=.

````

After executing this we can see that no `foo.h` is present in the html report.

![report](./enum_report_screen.png)

