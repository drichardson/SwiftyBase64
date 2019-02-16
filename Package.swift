// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwiftyBase64",
    products: [
        .library(name:"SwiftyBase64", type:.dynamic, targets:["SwiftyBase64"]),
    ],
    dependencies: [],
    targets: [
	.target(name:"SwiftyBase64", dependencies: [], path: "SwiftyBase64"),
    ],
    swiftLanguageVersions: [4]
)
