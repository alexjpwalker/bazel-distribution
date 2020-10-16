load("@rules_pkg//:pkg.bzl", "pkg_tar")

def make_a_targz(name, deps):
    pkg_tar(
        name = name,
        deps = deps,
        extension = "tar.gz",
        package_dir_file = "package-dir.txt",
    )
