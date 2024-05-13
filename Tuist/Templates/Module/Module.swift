//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by stat on 5/13/24.
//

import ProjectDescription

let moduleName = Template.Attribute.required("name")

let template = Template(
    description: "Module Template",
    attributes: [moduleName],
    items: [
        .file(path: "Projects/Module/\(moduleName)/Project.swift",
              templatePath: "Project.stencil"),
        .file(path: "Projects/Module/\(moduleName)/Sources/\(moduleName).swift",
              templatePath: "Source.stencil")
    ]
)
