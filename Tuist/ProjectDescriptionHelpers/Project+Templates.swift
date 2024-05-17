import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    public enum Interface: String {
        
        case uikit, swiftui
        
        init(_ value: String) {
            self = Interface(rawValue: value.lowercased()) ?? .swiftui
        }
    }
    
    public static func app(name: String, interface: String) -> Project {
        return Project(
            name: name,
            targets: [
                .target(
                    name: name,
                    destinations: .iOS,
                    product: .app,
                    bundleId: .appBundleID(name),
                    infoPlist: interface.defaultInfoPlist,
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: []
                ),
                .target(
                    name: name + "Tests",
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: .appBundleID(name) + "Tests",
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [.target(name: name)]
                )
            ]
        )
    }
}

private extension String {
    
    static func appBundleID(_ name: String) -> String {
        return "com.statios." + name
    }
}

private extension InfoPlist {
    
    static var uikitDefault: InfoPlist {
        .extendingDefault(with: [
            "UIApplicationSceneManifest": .dictionary([
                "UIApplicationSupportsMultipleScenes": .boolean(false),
                "UISceneConfigurations": .dictionary([
                    "UISceneConfigurationName": .string("Default Configuration"),
                    "UISceneDelegateClassName": .string("$(PRODUCT_MODULE_NAME).SceneDelegate"),
                    "UISceneStoryboardFile": .string("Main")
                ])
            ])
        ])
    }
    
    static var swiftuiDefault: InfoPlist {
        .extendingDefault(with: [:])
    }
}

private extension Project.Interface {
    
    var defaultInfoPlist: InfoPlist {
        return switch self {
        case .uikit: .uikitDefault
        case .swiftui: .swiftuiDefault
        }
    }
}
