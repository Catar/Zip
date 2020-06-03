// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Zip",
    products: [
        .library(name: "Zip", targets: ["Zip"])
    ],
    targets: [
        .target(
            name: "Minizip",
            dependencies: [],
            path: "Zip/minizip",
            exclude: ["module"],
            linkerSettings: [
                .linkedLibrary("z")
            ]),
        .target(
            name: "Zip",
            dependencies: [
                .target(name: "Minizip"),
            ],
            path: "Zip",
            exclude: ["minizip", "zlib"]),
        .testTarget(
            name: "ZipTests",
            dependencies: [
                .target(name: "Zip"),
            ],
            path: "ZipTests"),
    ]
)
