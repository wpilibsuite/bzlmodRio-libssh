load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_libssh_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_headers",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-headers.zip",
        sha256 = "ddd1f5078496ad3316cc2e35881380909fb536e450900a7d3efb57f1cefbf4d7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_sources",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-sources.zip",
        sha256 = "143c25c10d9a11d84493e60d0270d4508f6fbf2cea2e08f79d1bde2a53ec6bbc",
        build_file_content = cc_library_sources,
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_linuxarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-linuxarm64static.zip",
        sha256 = "bf253a5dfec416137f1fad88c7ae5cb50d38757e60efcd0ef9ddf1f6af272b75",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_linuxx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-linuxx86-64static.zip",
        sha256 = "5d02d5aecc521d0c3cab5f3ec7c5668802f38337138e97fceb5e19a957888e60",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_osxuniversalstatic",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-osxuniversalstatic.zip",
        sha256 = "7acdb5f49fb3aa5fcea9cf4b1d806a42ea845f9dd628d72dec55837de09f3d3e",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_windowsx86-64static",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-windowsx86-64static.zip",
        sha256 = "849be403d4785a432d377a0392332839d8e293401c0509bcf3a8ea0b8a9255cc",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_windowsarm64static",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-windowsarm64static.zip",
        sha256 = "6d42d0854a6343ec30e7d569bddbfcefcafefcde8ed68f697ba7a0bc60446f2b",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_linuxarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-linuxarm64staticdebug.zip",
        sha256 = "b93418670c1b93589d5851580afdfb1b69339b4606d52f9d7f0501e9a073cd17",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_linuxx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-linuxx86-64staticdebug.zip",
        sha256 = "d7c75fabd584a6c155d3d784b8edeffa75296a96c03417a9fc0b4a5106c88210",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_osxuniversalstaticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-osxuniversalstaticdebug.zip",
        sha256 = "41863cf0a73256df147e6f72ead07b34111e13219dbdbabb082dea1ded8ece10",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_windowsx86-64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-windowsx86-64staticdebug.zip",
        sha256 = "347116aa6173a916fbb3362634ccd996c771499a564ef2b455212e38e07b267d",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_wpilib_thirdparty_libssh_windowsarm64staticdebug",
        url = "https://frcmaven.wpi.edu/development-2027/org/wpilib/thirdparty/libssh/2027-0.120-1/libssh-2027-0.120-1-windowsarm64staticdebug.zip",
        sha256 = "51dd10884606d839ede280bafa1ffdcefc466ac034a24e600aac3aeddf9d0d02",
        build_file = "@bzlmodrio-libssh//private/cpp/libssh:static.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_libssh_cpp_dependencies():
    __setup_bzlmodrio_libssh_cpp_dependencies(None)

setup_bzlmodrio_libssh_cpp_dependencies = module_extension(
    __setup_bzlmodrio_libssh_cpp_dependencies,
)
