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
            id: 1,
            hex: "D9D9D9",
            name: "Graycloth",
            brand: "Dulux",
            type: "Elastex Waterproof 3-in-1",
            price: 200_000,
            vafourite: false
        ),
        ProductModel(
            id: 2,
            hex: "D9D9D9",
            name: "Smokey Wings",
            brand: "Decolith",
            type: "Weather Shield",
            price: 220_000,
            vafourite: true
        )
    ]
}
