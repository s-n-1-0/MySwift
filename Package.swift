// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwift",
    defaultLocalization: "en",
    platforms: [
            .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MySwift",
            targets: ["MySwift"]),
        .library(
            name: "MySwiftAds",
            targets: ["MySwiftAds"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "12.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MySwift",
            dependencies: [],
            resources: [.process("Resources")]),
        .target(
            name: "MySwiftAds",
            dependencies: [
                "MySwift",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")],
            resources: []),
        .testTarget(
            name: "MySwiftTests",
            dependencies: ["MySwift"]),
    ]
)
