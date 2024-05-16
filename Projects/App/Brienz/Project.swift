import ProjectDescription

let project = Project(
    name: "Brienz",
    targets: [
        .target(
            name: "Brienz",
            destinations: [.iPhone, .iPad, .mac],
            product: .app,
            bundleId: "com.statios.Brienz",
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
                    target: "BRGallery",
                    path: .relativeToRoot("Projects/Feature/BRGallery")
                )
            ],
            environmentVariables: [
                "IDEPreferLogStreaming": "YES"
            ]
        )
    ]
)
