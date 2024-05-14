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
        favourite: false
    )
    
    
    var body: some View {
        HStack (alignment: .center, spacing: 12) {
            Rectangle()
                .frame(width: 60, height: 60)
                .foregroundColor(Color(hex: product.hex))
                .cornerRadius(8)
            VStack (alignment: .leading) {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(product.brand)
                    .font(.callout)
                Text("Rp \(product.price)")
                    .foregroundColor(.secondary)
            }
            Spacer()
            if product.favourite {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        product.favourite = false
                    }
            } else {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
                    .foregroundStyle(HierarchicalShapeStyle.quaternary)
                    .onTapGesture {
                        product.favourite = true
                    }
            }
        }
    }
}

#Preview {
    ProductCardView()
}
