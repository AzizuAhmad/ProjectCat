//
//  ProductCardView.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct ProductCardView: View {
    @State var product = ProductModel(
        id: 1,
        hex: "D9D9D9",
        name: "Graycloth",
        brand: "Dulux",
        type: "Elastex Waterproof 3-in-1",
        price: 200_000,
        vafourite: false
    )
    
    
    var body: some View {
        HStack (alignment: .center) {
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(hex: product.hex))
                .cornerRadius(8)
            VStack (alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(product.brand)
                Text("Rp \(product.price)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ProductCardView()
}
