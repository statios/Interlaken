//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by Stat on 5/17/24.
//

import ProjectDescription

private let name = Template.Attribute.required("name")
private let interface = Template.Attribute.required("interface")

private let projectPath = "Projects/App/\(name)/"
private let sourcesPath = projectPath + "Sources/"
private let resourcesPath = projectPath + "Resources/"
private let testsPath = projectPath + "Tests/"

private let template = Template(
    description: "App Template",
    attributes: [name, interface],
    items: "\(interface)".lowercased() == "uikit" ? uikitItems : swiftuiItems
)

private var uikitItems: [Template.Item] {
    [
        .file(path: sourcesPath + "AppDelegate.swift", templatePath: "UIKit/AppDelegate.stencil"),
        .file(path: sourcesPath + "SceneDelegate.swift", templatePath: "UIKit/SceneDelegate.stencil"),
        .file(path: sourcesPath + "ViewController.swift", templatePath: "UIKit/ViewController.stencil"),
        .file(path: resourcesPath + "Main.storyboard", templatePath: "UIKit/Main.stencil"),
        .directory(path: resourcesPath, sourcePath: "UIKit/Assets.xcassets"),
        .file(path: testsPath + "\(name)Tests.swift", templatePath: "UIKit/AppTests.stencil"),
        .file(path: projectPath + "Project.swift", templatePath: "Project.stencil")
    ]
}

private var swiftuiItems: [Template.Item] {
    [
        .file(path: sourcesPath + "\(name)App.swift", templatePath: "SwiftUI/App.stencil"),
        .file(path: sourcesPath + "ContentView.swift", templatePath: "SwiftUI/ContentView.stencil"),
        .directory(path: resourcesPath, sourcePath: "SwiftUI/Assets.xcassets"),
        .file(path: testsPath + "\(name)Tests.swift", templatePath: "SwiftUI/AppTests.stencil"),
        .file(path: projectPath + "Project.swift", templatePath: "Project.stencil")
    ]
}
