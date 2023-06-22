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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-headers.zip",
        sha256 = "2eb127caf76dafc8648f68ce41d1b8a896cb232ffcae205ced78b3c5b191bddd",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_sources",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-sources.zip",
        sha256 = "fefce4e2b7ab251e02ac20be1bec8e568dbfea1c44d36531f4e10829ad6cf8ac",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxarm32static.zip",
        sha256 = "3fd2be105c695a5a620b371c9ea7a9525711575c0645ee15f3c528cf2d255832",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxarm64static.zip",
        sha256 = "5e431ac3c8839bf5098e65da1e658914d8a21ddd80581645feb050494278cc40",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxx86-64static.zip",
        sha256 = "a7c022aa0a73ad86e1bdbb9dac6a4b127bd1f0ed921fbf1ece68600e3c427bc2",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-osxuniversalstatic.zip",
        sha256 = "d4673c44178629283274e25c16911ecca8132eb677edbc2c7650e5660b1cc0d5",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-windowsx86-64static.zip",
        sha256 = "315b6679f7c72c0bd22d555fe1fc64045b4cd83c08cf11fcfa0cf781830f288e",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86static",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-windowsx86static.zip",
        sha256 = "094a0d2276dc6516fc23efd8f72f29c8e421a98dcbbbd987c8e07dfa027c1511",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm32staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxarm32staticdebug.zip",
        sha256 = "3003093e056b9bcc99edeb177b35475b2173b4c756f7b62ef095d959f0152e03",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxarm64staticdebug.zip",
        sha256 = "e5db325aad9579382cd0b3163b1fa240bd5f73efe32aba4ab0d0aaa22f5cea3a",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-linuxx86-64staticdebug.zip",
        sha256 = "eec77c18405f3069e5fe6ddf1ef91ad24717c4883b575523c2a8f80b86b1ecd0",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-osxuniversalstaticdebug.zip",
        sha256 = "49aafe9bc94c5280d55d315b24c9fe60f4d668a6318bf0f42f9dbf27e34b9a45",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-windowsx86-64staticdebug.zip",
        sha256 = "d57a62fef06ef629343d80386de29a3931393fb0f626aef6bfe08b2b424a5067",
        build_file_content = cc_library_static,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_thirdparty_frc_libssh_windowsx86staticdebug",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/thirdparty/frc2023/libssh/0.95-7/libssh-0.95-7-windowsx86staticdebug.zip",
        sha256 = "059c35aaa574e7a73a21f38e3c2cffc3236d98962238a7cd45e6ce96db65aad8",
        build_file_content = cc_library_static,
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
