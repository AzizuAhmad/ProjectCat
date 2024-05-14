//
//  DetailProductViewFav.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI
import ACarousel

struct DetailProductViewFav: View {
    
    @State var isPresentingDetails: Bool = false
    
    let items: [Item] = images.map { Item(image: Image($0)) }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                ACarousel(items) { item in
                    item.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 250)
                        .cornerRadius(30)
                }
                .frame(height: 250)
                VStack {
                    Text("Trout")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Nippon Paint")
                        .font(.title2)
                    Text("#D9D9D9 • Elastex Waterproof 3-in-1")
                        .foregroundColor(.gray)
                }
                VStack (alignment: .leading, spacing: 12) {
                    Text("Product Specification")
                        .font(.title)
                        .fontWeight(.bold)
                    VStack{
                        row_data(col1: "Type", col2: "Emulsi elastomerik akrilik")
                        row_data(col1: "Texture", col2: "Low Sheen")
                        row_data(col1: "Color", col2: "Trout")
                        row_data(col1: "Specific Gravity", col2: "1.02 - 1.25 (White)")
                        row_data(col1: "Non-Volatile", col2: "57%")
                        row_data(col1: "Spread Power", col2: "6 - 7 m²/kg/lapis (90μ).")
                        row_data(col1: "", col2: "9 - 11 m²/kg/lapis (90μ).")
                    }
                    Text("Description")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Elastex Waterproof 3-in-1 adalah cat pelapis anti-bocor dengan sifat 3-in-1 dan teknologi Hydro-Flex. Berbahan dasar latex elastomerik akrilik yang sangat baik untuk mencegah kebocoran air, menutup retak ram- but, sebagai cat dasar yang unggul, dan dapat pula digunakan sebagai cat akhir. Cat ini memiliki sifat kedap air, elastis, tahan retak, anti-alkali, anti-jamur, daya rekat yang kuat dan anti-lumer/leleh.")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Elastex Waterproof 3-in-1 digunakan pada tempat-tempat yang sering mengalami kebocoran seperti pada langit-langit, atap, talang atau sambungan, atap genteng atau seng, atap asbes atau kayu, atap beton, tangki air, tembok bagian luar, dll. Cat ini dapat digunakan pada semen/beton, kayu, besi dan seng.")
                        .fixedSize(horizontal: false, vertical: true)
                    Button {
                        print("Unfavourite")
                    } label: {
                        Spacer()
                        Text("Unfavourite")
                        Spacer()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    Button {
                        isPresentingDetails.toggle()
                    } label: {
                        Spacer()
                        Text("See Details Information")
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 1) // Menambahkan border dengan warna biru dan ketebalan 1
                    )
                    .sheet(isPresented: $isPresentingDetails, content: {
                        DetailsView()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    })
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationBarTitle("Detail Product")    }
}

#Preview {
    DetailProductViewFav()
}
