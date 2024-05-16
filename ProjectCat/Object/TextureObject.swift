//
//  TextureObject.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import Foundation

enum TextureObject : String, CaseIterable, Identifiable {
    case doff = "Solid (Doff/Mate)"
    case glossy = "Mengkilap (Glossy)"
    case eggshell = "Bertekstur halus (Eggshell)"
    case satin = "Lembut (Satin)"
    var id: Self { self }
}

