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
    
//    init(id: UUID, imageFav: String, imageBrand: String, hex: String, name: String, brand: String, type: String, price: Int, favourite: Bool) {
//        self.id = id
//        self.imageFav = imageFav
//        self.imageBrand = imageBrand
//        self.hex = hex
//        self.name = name
//        self.brand = brand
//        self.type = type
//        self.price = price
//        self.favourite = favourite
//    }
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
