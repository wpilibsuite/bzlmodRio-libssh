
#include <libssh/libssh_version.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) { EXPECT_NE(0, LIBSSH_VERSION_INT); }
