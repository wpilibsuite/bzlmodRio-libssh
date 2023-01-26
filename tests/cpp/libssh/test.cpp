
#include "gtest/gtest.h"
#include <libssh/libssh_version.h>

TEST(BasicTest, BasicTest) {
    EXPECT_NE(0, LIBSSH_VERSION_INT);
}