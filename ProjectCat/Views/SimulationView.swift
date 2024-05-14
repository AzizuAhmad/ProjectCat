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
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading,spacing: 16) {
                Image("simulation-room")
                    .resizable()
                    .scaledToFit()
                HStack (spacing: 12) {
                    ForEach(recomendations, id: \.self) { recomendation in
                        VStack {
                            Rectangle()
                                .frame(width: 68, height: 48)
                                .foregroundColor(Color(hex: "#\(recomendation)"))
                                .cornerRadius(8)
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
                .frame(maxWidth: .infinity)
                VStack {
                    Text("Recommendation Product")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Tap the card below to see details information")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 16)
                VStack {
                    Text("Paint Characteristics")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Different characteristics display for different result")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 16)
                NavigationView {
                    Form {
                        Section {
                            Picker("Texture", selection: $selectedTexture) {
                                ForEach(TextureObject.allCases, id: \.self) { texture in
                                    Text(texture.rawValue.capitalized)
                                }
                            }
                            Picker("Texture", selection: $selectedTexture) {
                                ForEach(TextureObject.allCases, id: \.self) { texture in
                                    Text(texture.rawValue.capitalized)
                                }
                            }
                            Picker("Texture", selection: $selectedTexture) {
                                ForEach(TextureObject.allCases, id: \.self) { texture in
                                    Text(texture.rawValue.capitalized)
                                }
                            }
                            Picker("Texture", selection: $selectedTexture) {
                                ForEach(TextureObject.allCases, id: \.self) { texture in
                                    Text(texture.rawValue.capitalized)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Simulation")
    }
}

#Preview {
    SimulationView()
}
