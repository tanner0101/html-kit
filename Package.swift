// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "html-kit",
    products: [
        .library(name: "HTMLKit", targets: ["HTMLKit"]),
    ],
    targets: [
        .target(name: "HTMLKit"),
        .testTarget(name: "HTMLKitTests", dependencies: ["HTMLKit"]),
    ]
)
