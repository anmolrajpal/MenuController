// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MenuController",
    platforms: [ .iOS(.v13) ],
    products: [ .library(name: "MenuController", targets: ["MenuController"]) ],
    dependencies: [ .package(url: "https://github.com/anmolrajpal/InteractiveModal", from: "1.0.2") ],
    targets: [ .target(name: "MenuController", dependencies: ["InteractiveModal"]) ],
    swiftLanguageVersions: [.v5]
)
