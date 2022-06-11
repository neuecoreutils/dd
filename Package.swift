// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "dd-test",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        // .package(url: "https://github.com/jkandzi/Progress.swift", from: "0.4.0")

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "dd-test",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                // .product(name: "Progress", package: "Progress.swift"),
            ]),
        .testTarget(
            name: "dd-testTests",
            dependencies: ["dd-test"]),
    ]
)
