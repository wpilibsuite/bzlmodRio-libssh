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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-headers.zip",
        sha256 = "266a13c81556aecee5b8b753d9bd444f76b670e34dda259b9403ec45f2b4f055",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-sources.zip",
        sha256 = "2199b9cb674e69f61f020379fdec3ba34faeb256871826db4fe2b1c928016177",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxarm32static.zip",
        sha256 = "dcc81a92c0988732c903265b6561b8906e501be7b4bac2aeee3e3586df98abc0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxarm64static.zip",
        sha256 = "07dea29c621ae6d92e6f2c12252b9d085370fb4d526dd73f3b778b2397d206bf",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxx86-64static.zip",
        sha256 = "07b5be45bfe07dfaadaf7ab32d71302499a764f0fa915c61c96c8a5a4521b243",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-osxuniversalstatic.zip",
        sha256 = "6a99e89759544938976211a85b43c5f1933cacaf2f683268d4ab673d8dc57e10",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-windowsx86-64static.zip",
        sha256 = "40fd4d1c67e47b81b18ef67f43f4bbb95897c3f4d4d36594c6a23e6d7addbc25",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-windowsx86static.zip",
        sha256 = "2ada6d9062faa14dbb647cfbadc209ee18b7b7c5b37c7fd334340a51f8f121bc",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxarm32staticdebug.zip",
        sha256 = "363410ae640be814aaad4c3c9d7603d432325f3bc02de9189467776f07c10669",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxarm64staticdebug.zip",
        sha256 = "6a5dac9a005ef1b271c3351b0158a8806e7eeee7bed4fc5928748fc3419ac9e4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-linuxx86-64staticdebug.zip",
        sha256 = "d4b5a090a3c70f3e951d4e274f27a84ec79fa802d0858cac7c41aa1d3a8c5f37",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-osxuniversalstaticdebug.zip",
        sha256 = "b8e3bcd22bbaefd0a7936b5278d0b3417707b0b3c414de9cd720d55a31571cfd",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-windowsx86-64staticdebug.zip",
        sha256 = "978ab420adc41f5f92ef3ca7fd45aa959aa8e941e422adca9fb11b1b96b34cba",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-6/libssh-0.95-6-windowsx86staticdebug.zip",
        sha256 = "19558dfeeea94eba46d1057499d46734ba5eae2fffe2fcdcc8b469a34b84c126",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
