//
//  ProductObject.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import Foundation

class ProductObject : ObservableObject {
    @Published var mockProduct = [
        ProductModel(
            id: UUID(),
            imageFav: "paintCat",
            imageBrand: "nipponpaint",
            hex: "D9D9D9",
            name: "Graycloth",
            brand: "Dulux",
            type: "Elastex Waterproof 3-in-1",
            price: 201_000,
            favourite: false
        ),
        ProductModel(
            id: UUID(),
            imageFav: "paintCat",
            imageBrand: "nipponpaint",
            hex: "D9D9D9",
            name: "Smokey Wings",
            brand: "Dana Paint",
            type: "Elastex Waterproof 3-in-1",
            price: 202_000,
            favourite: false
        ),
        ProductModel(
            id: UUID(),
            imageFav: "paintCat",
            imageBrand: "nipponpaint",
            hex: "D9D9D9",
            name: "Steel Grit",
            brand: "Jotun",
            type: "Elastex Waterproof 3-in-1",
            price: 203_000,
            favourite: false
        ),
        ProductModel(
            id: UUID(),
            imageFav: "paintCat",
            imageBrand: "nipponpaint",
            hex: "D9D9D9",
            name: "Stylish Grey",
            brand: "Decolith",
            type: "Weather Shield",
            price: 220_000,
            favourite: true
        )
    ]
}
