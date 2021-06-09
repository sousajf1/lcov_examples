#include "foo.h"

namespace foo {
    int sum(foo_enum x, int y) {
        return static_cast<int>(x) + y;
    }
}
