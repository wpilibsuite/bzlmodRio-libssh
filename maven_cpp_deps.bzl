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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-headers.zip",
        sha256 = "5b7052c4551e8ac3adb183544ccaf6153d5e6503f8562781fd3e40756bcadb4b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-sources.zip",
        sha256 = "91e27cd409cfe4377dd50f8dfe14074dde0cd0760f5bcb178fc27428eab8e20d",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxarm32static.zip",
        sha256 = "db008a36736422d6efafedeb0fae5edc03a6a4b6cef6e0ff1b63710bde113a35",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxarm64static.zip",
        sha256 = "a4c7876abb87e586eed8aa347645baad44fb76c96985dd581b0eb21a472e4b67",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxx86-64static.zip",
        sha256 = "f149b01303c2653e971588dd8482a5f82fa72ae3566726b048c96c1a0ed2ce33",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-osxuniversalstatic.zip",
        sha256 = "b8f6d6525d231628ea8f87d4b7bd0ca69f1efa8c49df62874d91c7095c8e726e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsx86-64static.zip",
        sha256 = "0bff039f1167014f771a012c3bb608f72b6f55cc2a0d6964db664fcf65a0e995",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsx86static.zip",
        sha256 = "bb282e315322c2e4387994d90f69cb54bebaa22ae21a68bb1d6bd90e140169b8",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsarm64static.zip",
        sha256 = "fbc7df4d349ed5e693d6fb4aec0617de0a6b9885acfcb8f099a70504362a17ee",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxarm32staticdebug.zip",
        sha256 = "6783533c3c984996d1b56d8e9a9fba68509b761900e321fcb32ced2dc1c08833",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxarm64staticdebug.zip",
        sha256 = "e07222035e1a6eb097c47041520f0818436a97b9023f59ad2e6f15d5ea9c8ca5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-linuxx86-64staticdebug.zip",
        sha256 = "224000035a438dbe04d5723201e7cc7ba979b3f178f79f10c17048b0771af9e6",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-osxuniversalstaticdebug.zip",
        sha256 = "6f86a144abe13871530d234a7ed49516a633d4b2ff4c96676fd2d0c2369928d4",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsx86-64staticdebug.zip",
        sha256 = "63c09aaa16d9145625fc4f583b6a507a9a3e252acbedf1d192fccf0c6ae6ebad",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsx86staticdebug.zip",
        sha256 = "72d68cf04ea4c4fca2ba99c596c8f25349aaa9cfe18bb8512d695ce7462cbfc7",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2024/libssh/0.105-1/libssh-0.105-1-windowsarm64staticdebug.zip",
        sha256 = "6b332a973699a9e0eba6f3f3b51292cb7f29f6614d750fd9d9d2a2f1f0a3bbe9",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
