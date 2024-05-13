//
//  Foundation.swift
//  ProjectDescriptionHelpers
//
//  Created by stat on 5/13/24.
//

import ProjectDescription

private let name = Template.Attribute.required("name")

private let template = Template(
    description: "Feature Template",
    attributes: [name],
    items: [
        .file(path: "Projects/Feature/\(name)/Project.swift",
              templatePath: "Project.stencil"),
        .file(path: "Projects/Feature/\(name)/Sources/\(name).swift",
              templatePath: "Source.stencil")
    ]
)
