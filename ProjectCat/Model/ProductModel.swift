//
//  ProductModel.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import Foundation

struct ProductModel : Identifiable {
    var id: Int
    var hex: String
    var name: String
    var brand: String
    var type: String
    var price: Int
    var favourite: Bool
}
