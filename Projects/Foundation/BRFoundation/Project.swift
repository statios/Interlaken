import ProjectDescription

private var dependencyModules = [
    "DesignSystem",
    "Network",
    "DataLogging"
]

let project = Project(
    name: "BRFoundation",
    targets: [
        .target(
            name: "BRFoundation",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.BRFoundation",
            sources: ["Sources/**"],
            dependencies: dependencyModules.map {
                TargetDependency.project(
                    target: $0,
                    path: .relativeToRoot("Projects/Module/\($0)")
                )
            }
        )
    ]
)
