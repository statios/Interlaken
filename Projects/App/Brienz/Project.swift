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
                    "UILaunchScreen": .dictionary([:])
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "BrienzHome",
                    path: .relativeToRoot("Projects/Feature/BrienzHome")
                )
            ],
            environmentVariables: [
                "IDEPreferLogStreaming": "YES"
            ]
        )
    ]
)
