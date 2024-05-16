import ProjectDescription

let project = Project(
    name: "Holdrio",
    targets: [
        .target(
            name: "Holdrio",
            destinations: [.iPhone, .iPad, .mac],
            product: .app,
            bundleId: "com.statios.Holdrio",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": .dictionary([:]),
                    "NSAppTransportSecurity": .dictionary([
                        "NSAllowsArbitraryLoads": .boolean(true)
                    ])
                ]
            ),
            sources: ["Sources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "HRGallery",
                    path: .relativeToRoot("Projects/Feature/HRGallery")
                )
            ],
            environmentVariables: [
                "IDEPreferLogStreaming": "YES"
            ]
        )
    ]
)
