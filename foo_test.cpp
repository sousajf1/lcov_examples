#define CATCH_CONFIG_MAIN
#include "catch.hpp"
#include "foo.h"

TEST_CASE( "sum(1,1)", "[foo]" ) {
    foo::foo_enum val = foo::foo_enum::ENUM_VALUE1;
    REQUIRE(foo::sum(val,1) == 2);
}
