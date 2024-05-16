//
//  ProductModel.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import Foundation

struct ProductModel : Identifiable {
    var id: UUID
    var imageFav: String
    var imageBrand: String
    var hex: String
    var name: String
    var brand: String
    var type: String
    var price: Int
    var favourite: Bool
}

var defaultPaint = ProductModel(
    id: UUID(),
    imageFav: "noImage",
    imageBrand: "noImage",
    hex: "noColor",
    name: "NoName",
    brand: "Nobrand",
    type: "noType",
    price: 0,
    favourite: true
)
