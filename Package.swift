// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUISettings",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "SwiftUISettings",
            targets: ["SwiftUISettings"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/anconaesselmann/UserPreferences", from: "1.0.2"),
    ],
    targets: [
        .target(
            name: "SwiftUISettings",
            dependencies: ["UserPreferences"]
        )
    ]
)
