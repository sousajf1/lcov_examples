#include "foo.h"

int main(){
    foo::foo_enum val = foo::foo_enum::ENUM_VALUE1;
    return foo::sum(val, 2);
}
