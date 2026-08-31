// swift-tools-version: 6.3
import PackageDescription

let package = Package(
    name: "stylx",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .macCatalyst(.v26),
        .watchOS(.v26),
        .tvOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(name: "stylx", targets: ["stylx"])
    ],
    targets: [
        .target(name: "stylx")
    ]
)
