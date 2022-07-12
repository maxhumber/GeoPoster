// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeoPoster",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "GeoPoster", targets: ["GeoPoster"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "GeoPoster", dependencies: []),
        .testTarget(name: "GeoPosterTests", dependencies: ["GeoPoster"]),
    ]
)
