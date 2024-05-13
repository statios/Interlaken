import ProjectDescription

let project = Project(
    name: "DataLogging",
    packages: [
        .remote(
            url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework",
            requirement: .upToNextMajor(from: "6.14.3")
        ),
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk",
            requirement: .upToNextMajor(from: "10.26.0")
        )
    ],
    targets: [
        .target(
            name: "DataLogging",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.DataLogging",
            sources: ["Sources/**"],
            dependencies: [
                .package(product: "AppsFlyerLib"),
                .package(product: "FirebaseAnalytics")
            ]
        )
    ]
)
