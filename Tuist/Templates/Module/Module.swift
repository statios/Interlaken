//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by stat on 5/13/24.
//

import ProjectDescription

private let name = Template.Attribute.required("name")

private let template = Template(
    description: "Module Template",
    attributes: [name],
    items: [
        .file(path: "Projects/Module/\(name)/Project.swift",
              templatePath: "Project.stencil"),
        .file(path: "Projects/Module/\(name)/Sources/\(name).swift",
              templatePath: "Source.stencil")
    ]
)
