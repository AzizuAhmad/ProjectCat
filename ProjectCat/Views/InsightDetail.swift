//
//  InsightDetail.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct InsightDetail: View {
    
    @State var recomendations : [String] = ["D9D9D9", "D0D0D0", "EAEAEA", "BABABA", "C7B7A3", "EADBC8", "B5C18E"]
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { reader in
            VStack (spacing: 12) {
                Image("insightImage")
                    .resizable()
                    .padding(.horizontal, 16)
                    .frame(width: reader.size.width,height: 250)
                    .scaledToFill()
                ScrollView(.vertical){
                    LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                        ForEach(recomendations, id:\.self){recomendation in
                            Button(action: {
                                let clipboard = UIPasteboard.general
                                clipboard.setValue(recomendation, forPasteboardType: UTType.plainText.identifier)
                            }, label: {
                                VStack {
                                    Rectangle()
                                        .frame(width: 172,height: 100)
                                        .foregroundColor(Color(hex: "#\(recomendation)"))
                                        .cornerRadius(10)
                                    HStack (spacing: 2) {
                                        Text("#\(recomendation)")
                                            .font(.system(size: 17,weight: .regular))
                                        Image(systemName: "doc.on.doc")
                                            .imageScale(.small)
                                    }
                                    Text("Sakura")
                                        .font(.system(size: 17,weight: .regular))
                                        .foregroundColor(.black)
                                    
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationTitle("Colours of The Year 2024")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InsightDetail()
}
