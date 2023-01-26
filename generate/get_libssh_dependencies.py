import sys
import os

from bazelrio_gentool.deps.dependency_container import DependencyContainer


def _default_native_static_platforms():
    platforms = [
        "linuxx86-64",
        "osxx86-64",
        "windowsx86-64",
        "windowsx86",
    ]
    return [x + "static" for x in platforms]


def get_libssh_dependencies():
    year = "2022"
    version = "0.95-1"

    group_id = f"edu.wpi.first.thirdparty.frc{year}"

    group = DependencyContainer(
        "bzlmodrio-libssh", version, year, "https://frcmaven.wpi.edu/release"
    )
    group.create_cc_dependency(
        f"libssh",
        parent_folder="libssh",
        group_id=group_id,
        headers="headers",
        sources=None,
        resources=_default_native_static_platforms(),
        has_jni=False,
    )

    return group


if __name__ == "__main__":
    get_opencv_dependencies()
