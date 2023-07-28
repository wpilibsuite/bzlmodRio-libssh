load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_libssh_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-headers.zip",
        sha256 = "8f8b8698271fe5396d461ee4865f8f4d7f6466bd44d4c004f15fca447c789e97",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-sources.zip",
        sha256 = "1594c88f32e08e5a7f80273cafd24ac3126635de884367eadc3c133fa375f20c",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxarm32static.zip",
        sha256 = "b8a8317b3c9daab48517bdbc0b94440c65f84ba7defed6293babfc786cbb3b50",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxarm64static.zip",
        sha256 = "89cee63dd24822bcbd38b5dc81ad77c5a1c70fb12c74fcc93dea85973a2c10f1",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxx86-64static.zip",
        sha256 = "0ae55f969f8f9f979b8b32090e8b0b83d8b8717d7cbf1a050bdc15bddb55cbe8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-osxuniversalstatic.zip",
        sha256 = "1f755a31fe443121dc83f93bc7079beef7a39d21782d9f30b62b661b4925f239",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-windowsx86-64static.zip",
        sha256 = "17d6bc98204447e90b586c2b41a748ed0380b2a618db3bdfe38137f756f87dea",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-windowsx86static.zip",
        sha256 = "397ed4136809096b7bae00c2ebad9601683ef2ee2fbc3a7def81478c798ab57a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxarm32staticdebug.zip",
        sha256 = "bc2d08e9dda3a47409bee825fe4f62dc6c3b85e90beaf1cac4a6202c0dc1555a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxarm64staticdebug.zip",
        sha256 = "83bfcd69b0e9043b267617565d38b70658477688bb73109b44e08299b4667175",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-linuxx86-64staticdebug.zip",
        sha256 = "ffad15da34b74b43ccb5e1b7a40d9eb04a68e1af241c0f65a93f28aafdc243bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-osxuniversalstaticdebug.zip",
        sha256 = "fd8cbc3b3474e421aa8fa1f673cd21f833cab3d43ea8a239a6dd273d369292b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-windowsx86-64staticdebug.zip",
        sha256 = "c46eebd3d5753f01a0fe005f8f05e146637a6ff4b5b891af4cf552df6121f4cf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-8/libssh-0.95-8-windowsx86staticdebug.zip",
        sha256 = "95f92fb5f20aaadb9ca825ddd31a733b1a78f16999ad0cc7b931a95da16dd192",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
