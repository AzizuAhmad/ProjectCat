//
//  HomeView.swift
//  ProjectCat
//
//  Created by MacBook Air on 07/05/24.
//

import SwiftUI

import ACarousel

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

let roles = ["ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1", "ImageGrid1"]



struct HomeView: View {
    
    var body: some View {
            VStack{
//                Divider()
////                    .frame(height: 2)
//                    .overlay(.black)
                mainFunction()
                HeadlineText()
                gridItem()
                HeadlineText()
                gridItem()
                
                
                Spacer()
                
            }
    }
}

#Preview {
    HomeView()
}

struct mainFunction: View {
    var body: some View {
        HStack{
            Text("Simulation Your Room")
                .font(.system(size: 20))
                .foregroundStyle(Color("ColorText"))
            Image("SimulationImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                

        }
        .frame(width: 350, height: 200)
        .background(Color("SimulationColor"))
        .cornerRadius(30)
        .padding()
    }
}

struct HeadlineText: View {
    var body: some View {
        HStack{
            Text("Headline Paint")
                .font(.system(size: 24,
                              weight: .semibold,
                              design: .default))
//                .border(Color.black)
            Spacer()
        }
        .padding(.horizontal,20)
    }
}



struct gridItem: View {
    
    let row: [GridItem] = [GridItem(.flexible())]
    let items: [Item] = roles.map { Item(image: Image($0)) }

    
    var body: some View {
//        ScrollView(.horizontal){
//            LazyHGrid(rows: row) {
//                ForEach(0..<10) { _ in
//                            Image("ImageGrid1")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: nil)
//                                .cornerRadius(10)
//                }
//                
//            }
//            .padding(.horizontal,10)
//            
//        }
//        .frame(height: 170)
//                .border(Color.black)
//                .background(.red)
        
        ACarousel(items, spacing:1, headspace: 20) { item in
                    item.image
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                        .cornerRadius(10)
                        .padding(.leading,-50)
//                        .border(Color.black)

                }
                .padding(.horizontal,10)
                .frame(height: 170)
    }
}

