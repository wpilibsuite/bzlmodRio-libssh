from get_libssh_dependencies import get_libssh_dependencies


def main():
    group = get_libssh_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
