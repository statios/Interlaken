import ProjectDescription

let project = Project(
    name: "HRGallery",
    targets: [
        .target(
            name: "HRGallery",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.HRGallery",
            sources: ["Sources/**"],
            dependencies: [
                TargetDependency.project(
                    target: "HRFoundation",
                    path: .relativeToRoot("Projects/Foundation/HRFoundation")
                )
            ]
        )
    ]
)
