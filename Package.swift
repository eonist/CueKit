// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CueKit",
    products: [
        .library(
            name: "CueKit",
            targets: ["CueKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CueKit",
            dependencies: []),
        .testTarget(
            name: "CueKitTests",
            dependencies: ["CueKit"]),
    ]
)
