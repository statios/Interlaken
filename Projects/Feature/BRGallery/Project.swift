import ProjectDescription

let project = Project(
    name: "BRGallery",
    targets: [
        .target(
            name: "BRGallery",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.BRGallery",
            sources: ["Sources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "BRFoundation",
                    path: .relativeToRoot("Projects/Foundation/BRFoundation")
                )
            ]
        )
    ]
)
