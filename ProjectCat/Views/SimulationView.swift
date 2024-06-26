//
//  SimulationView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI
import UniformTypeIdentifiers

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct SimulationView: View {
    @State var recomendations : [String] = ["D9D9D9", "D0D0D0", "EAEAEA", "BABABA"]
    @State var selectedTexture : TextureObject = .doff
    @State var selectedLighting : LightingObject = .natural
    @State var selectedColor : String = "D9D9D9"
    @State var colorInput: Color = Color.blue
    @ObservedObject var ProductManager: ProductObject
    
    var body: some View {
        VStack (spacing: 16) {
            Image("simulation-room")
                .resizable()
                .scaledToFit()
            
            HStack (spacing: 12) {
                ForEach(recomendations, id: \.self) { recomendation in
                    VStack {
                        if (selectedColor == recomendation) {
                            Rectangle()
                                .frame(width: 68, height: 48)
                                .foregroundColor(Color(hex: "#\(recomendation)"))
                                .cornerRadius(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 1.3)
                                )
                                .onTapGesture {
                                    selectedColor = recomendation
                                }
                        } else {
                            Rectangle()
                                .frame(width: 68, height: 48)
                                .foregroundColor(Color(hex: "#\(recomendation)"))
                                .cornerRadius(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.secondary, lineWidth: 0.3)
                                )
                                .onTapGesture {
                                    selectedColor = recomendation
                                }
                        }
                        Button(action: {
                            let clipboard = UIPasteboard.general
                            clipboard.setValue(recomendation, forPasteboardType: UTType.plainText.identifier)
                        }, label: {
                            HStack (spacing: 2) {
                                Text("#\(recomendation)")
                                    .font(.caption)
                                Image(systemName: "doc.on.doc")
                                    .imageScale(.small)
                            }
                        })
                    }
                }
            }
                
            Form {
                /// Paint Characteristics
                Section {
                    ColorPicker("Paint Color", selection: $colorInput)
                    Picker("Texture", selection: $selectedTexture) {
                        ForEach(TextureObject.allCases, id: \.self) { texture in
                            Text(texture.rawValue.capitalized)
                        }
                    }
                    Picker("Room Lighting", selection: $selectedLighting) {
                        ForEach(LightingObject.allCases, id: \.self) { lighting in
                            Text(lighting.rawValue.capitalized)
                        }
                    }
                } header: {
                    Text("Paint Characteristics")
                } footer: {
                    Text("Different characteristics display for different result")
                }
                /// Product Recomendations
                Section {
                    ForEach($ProductManager.mockProduct, id: \.id) { product in
                        NavigationLink {
                            DetailProductView()
                        } label: {
                            HStack (alignment: .center, spacing: 12) {
                                Rectangle()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(Color(hex: product.hex.wrappedValue))
                                    .cornerRadius(8)
                                VStack (alignment: .leading) {
                                    Text(product.name.wrappedValue)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text(product.brand.wrappedValue)
                                        .font(.callout)
                                    Text("Rp \(product.price.wrappedValue)")
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(product.favourite.wrappedValue ? Color(.red) : Color(.gray))
                                    .onTapGesture {
                                        product.favourite.wrappedValue.toggle()
                                        print(product.favourite)

                                    }
                            }
                        }
                    }
                } header: {
                    Text("Product Recomendation")
                } footer: {
                    Text("Tap the card above to see details product information")
                }
            }
        }
        .navigationBarTitle("Simulation")
    }
}

#Preview {
    SimulationView(ProductManager: ProductObject())
}
