import ProjectDescription

let project = Project(
    name: "BrienzHome",
    targets: [
        .target(
            name: "BrienzHome",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.BrienzHome",
            sources: ["Sources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "BrienzFoundation",
                    path: .relativeToRoot("Projects/Foundation/BrienzFoundation")
                )
            ]
        )
    ]
)
