#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

exports_files(["archiver.py", "common.py"])

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("//common:rules.bzl", "make_a_targz")

bzl_library(
    name = "lib",
    srcs = [
        "assemble_versioned.bzl",
        "checksum.bzl",
        "generate_json_config.bzl",
        "java_deps.bzl",
        "rules.bzl",
        "tgz2zip.bzl",
    ],
    visibility = ["//visibility:public"]
)

py_binary(
    name = "java_deps",
    srcs = ["java_deps.py"],
    visibility = ["//visibility:public"]
)

py_binary(
    name = "tgz2zip",
    srcs = ["tgz2zip.py"],
    visibility = ["//visibility:public"]
)

py_library(
    name = "common",
    srcs = ["common.py"],
    visibility = ["//visibility:public"]
)

py_binary(
    name = "assemble-versioned",
    srcs = ["assemble-versioned.py"],
    deps = [":common"],
    visibility = ["//visibility:public"]
)

exports_files(
    ["hello.txt", "lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-nullam-malesuada-elit-nec-eros-vehicula-eget-interdum-enim-pharetra.txt"],
)

my_targz_files = {
    "lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-nullam-malesuada-elit-nec-eros-vehicula-eget-interdum-enim-pharetra.txt": "lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-nullam-malesuada-elit-nec-eros-vehicula-eget-interdum-enim-pharetra/directory2/directory3/directory4/directory5/directory6/directory7/directory8/directory9/lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-nullam-malesuada-elit-nec-eros-vehicula-eget-interdum-enim-pharetra.txt",
    "hello.txt": "directory1/directory2/directory3/directory4/directory5/directory6/directory7/directory8/directory9/hello.txt",
}

make_a_targz(
    name = "our-targz",
    deps = ["common.tgz"],
    files = {},
    output_filename = "our-targz",
)

make_a_targz(
    name = "bad-targz",
    deps = ["our-targz.tar.gz"],
    files = {},
    output_filename = "bad-targz",
)
