import ProjectDescription

let project = Project(
    name: "BrienzFoundation",
    targets: [
        .target(
            name: "BrienzFoundation",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.BrienzFoundation",
            sources: ["Sources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "DesignSystem",
                    path: .relativeToRoot("Projects/Module/DesignSystem")
                )
            ]
        )
    ]
)
