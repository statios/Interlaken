import ProjectDescription

private var dependencyModules = [
    "DesignSystem",
    "Network",
    "DataLogging"
]

let project = Project(
    name: "HRFoundation",
    targets: [
        .target(
            name: "HRFoundation",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.HRFoundation",
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
