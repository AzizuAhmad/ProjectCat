//
//  LightingObject.swift
//  ProjectCat
//
//  Created by MacBook Air on 15/05/24.
//

import Foundation

enum LightingObject : String, Identifiable, CaseIterable {
    case none = "Tidak ada"
    case natural = "Cahaya matahari"
    case lamp = "Hanya lampu"
    case all = "Matahari dan Lampu"
    var id: Self { self }
}
