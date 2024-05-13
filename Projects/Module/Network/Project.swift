import ProjectDescription

let project = Project(
    name: "Network",
    targets: [
        .target(
            name: "Network",
            destinations: [.iPhone, .iPad, .mac],
            product: .staticFramework,
            bundleId: "com.statios.Network",
            sources: ["Sources/**"]
        )
    ]
)
