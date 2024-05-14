//
//  TextureObject.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import Foundation

enum TextureObject : String, CaseIterable, Identifiable {
    case doff, glossy
    var id: Self { self }
}

