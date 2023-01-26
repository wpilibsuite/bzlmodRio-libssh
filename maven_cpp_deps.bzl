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
static_srcs = glob(["**/*.lib", "**/*.a"], exclude=["**/*jni.lib"])
shared_srcs = glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/*jni.dll", "**/*jni.so", "**/*.so.debug", "**/libopencv_java*.dylib"])
shared_jni_srcs = glob(["**/*jni.dll", "**/*jni.so*", "**/*.jni.dylib", "**/libopencv_java*.dylib"], exclude=["**/*.so.debug"])

cc_library(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
    deps = [
        ":static_libs",
    ]
)

cc_library(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_libssh_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/libssh/0.95-1/libssh-0.95-1-headers.zip",
        sha256 = "2964545c9bd5131218641c1e31488d39edd2eabe77883818d346536025ff664d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/libssh/0.95-1/libssh-0.95-1-linuxx86-64static.zip",
        sha256 = "b19732cbab82e432d9c4b8e17ad03b5e00d2771b7dbbab9c2ccc4948263f7a22",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/libssh/0.95-1/libssh-0.95-1-osxx86-64static.zip",
        sha256 = "871cdf9713ebbccb130993ee46821ed38dd3956780c7905ed4a450aa4bd89c91",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/libssh/0.95-1/libssh-0.95-1-windowsx86-64static.zip",
        sha256 = "9a38e264cff4450dfedc729453ffb6367c93afee25e2073e46b043666c472602",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2022/libssh/0.95-1/libssh-0.95-1-windowsx86static.zip",
        sha256 = "fe7a92663b8ad5aecea2432dc1203d11e0a4d5f1939c41694ef0445cb9336cd6",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
