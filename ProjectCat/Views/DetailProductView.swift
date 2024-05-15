//
//  DetailProductView.swift
//  Multiple-Choise
//
//  Created by MacBook Air on 08/05/24.
//

import SwiftUI
import ACarousel

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

let images = ["img_0", "img_1", "img_2", "img_3", "img_4", "img_5", "img_6"]

struct DetailProductView: View {
    
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
                    Text("How to Use")
                        .font(.title2)
                        .fontWeight(.bold)
                    VStack{
                        row_data(col1: "Solvent", col2: "Water")
                        row_data(col1: "Dilution", col2: "10 - 20% on the first layer, 0 - 5% onthe soend and third layer.")
                        row_data(col1: "Applicate with", col2: "Brush, Roll, Airless Spray")
                        row_data(col1: "Layers", col2: "2 or 3 layers")
                    }
                    
                    Text("Application")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Waktu kering akan terhambat pada temperatur udara yang rendah. Jangan aplikasikan cat pada kelembaban udara >85% dan atau temperatur udara <7°C. Semua peralatan sebaiknya langsung dibersihkan dengan air setelah selesai digunakan. Jangan lakukan tinting dengan pigmen berbahan dasar minyak/thinner.")
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Dry Time (30° C)")
                        .font(.title2)
                        .fontWeight(.bold)
                    VStack{
                        row_data(col1: "Kering Sentuh", col2: "30 menit.")
                        row_data(col1: "Kering Keras", col2: "60 menit.")
                        row_data(col1: "Interval Pengecatan Selanjutnya", col2: "2 - 3 jam.")
                    }
                    
                    Button {
                        print("Favourite")
                    } label: {
                        Spacer()
                        Text("Add to Favourite")
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
        .navigationBarTitle("Detail Product")
    }
}

struct DetailsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading, spacing: 16) {
                    Text("Product Specification")
                        .font(.title2)
                        .fontWeight(.bold)
                    VStack{
                        row_data(col1: "Type", col2: "Emulsi elastomerik akrilik")
                        row_data(col1: "Texture", col2: "Low Sheen")
                        row_data(col1: "Color", col2: "Trout")
                        row_data(col1: "Specific Gravity", col2: "1.02 - 1.25 (White)")
                        row_data(col1: "Non-Volatile", col2: "57%")
                        row_data(col1: "Spread Power", col2: "6 - 7 m²/kg/lapis (90μ).")
                    }
                    
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Elastex Waterproof 3-in-1 adalah cat pelapis anti-bocor dengan sifat 3-in-1 dan teknologi Hydro-Flex. Berbahan dasar latex elastomerik akrilik yang sangat baik untuk mencegah kebocoran air, menutup retak ram- but, sebagai cat dasar yang unggul, dan dapat pula digunakan sebagai cat akhir. Cat ini memiliki sifat kedap air, elastis, tahan retak, anti-alkali, anti-jamur, daya rekat yang kuat dan anti-lumer/leleh.")
                    Text("Elastex Waterproof 3-in-1 digunakan pada tempat-tempat yang sering mengalami kebocoran seperti pada langit-langit, atap, talang atau sambungan, atap genteng atau seng, atap asbes atau kayu, atap beton, tangki air, tembok bagian luar, dll. Cat ini dapat digunakan pada semen/beton, kayu, besi dan seng.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("Details Information", displayMode: .inline)
        }
    }
}

struct row_data: View {
    var col1: String
    var col2: String
    var body: some View {
        HStack {
            HStack () {
                Text(col1)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .frame(width: 120)
            Text(col2)
            Spacer()
        }
        Rectangle()
            .frame(width: .infinity, height: 0.3)
            .opacity(0.3)
    }
}

#Preview {
    DetailProductView()
}
