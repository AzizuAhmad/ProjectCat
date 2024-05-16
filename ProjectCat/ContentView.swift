//
//  ContentView.swift
//  ProjectCat
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var WaterfallItemModels = [
        WaterfallItemModel(height: 150, imgString: "img_0", excerpt: "Sweet Embarce - Dulux Colour of the Year 2024"),
        WaterfallItemModel(height: 272, imgString: "img_1", excerpt: "Wild Wonder- Nippon Paint Colour of the Year 2024"),
        WaterfallItemModel(height: 312, imgString: "img_2", excerpt: "Irish White - Dulux Colour of the Year 2021"),
        WaterfallItemModel(height: 450, imgString: "img_3", excerpt: "Whisper Green - Nippon Paint Colour of the Year 2020"),
        WaterfallItemModel(height: 154, imgString: "img_4", excerpt: "Narvik Blue - Nippon Paint Best Colour of the Year 2021"),
        WaterfallItemModel(height: 323, imgString: "img_5", excerpt: "Tranquil Dawn - Dulux Tren Warna 2020"),
        WaterfallItemModel(height: 254, imgString: "img_6", excerpt: "Bright Skies - Dulux Colour of the Year 2022"),
        WaterfallItemModel(height: 350, imgString: "img_7", excerpt: "Light Grey - Nippon Paint Best Trend of 2023"),
        WaterfallItemModel(height: 234, imgString: "img_8", excerpt: "Valentine Pink - Nippon Paint Best Trend of 2022"),
        WaterfallItemModel(height: 250, imgString: "img_9", excerpt: "Milky Cream - Nippon Paint Best Colour of the Year 2019"),
        WaterfallItemModel(height: 244, imgString: "img_10", excerpt: "Milky Cream - Nippon Paint Best Colour of the Year 2019"),
    ]
    @StateObject var ProdauctManager = ProductObject()
    
    var body: some View {
        
        TabView{
            NavigationView{
                HomeView(products: ProdauctManager)
                    .navigationTitle("Start")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .destructiveAction){
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .foregroundColor(Color("LoginColor"))
                            
                        }
                    }
            }
            .tabItem {
                Label("Simulation",systemImage: "questionmark.bubble.fill")
            }
            NavigationView{
                FavoriteView(paintFav: ProdauctManager)
                    .navigationTitle("Favourite")
            }
            .searchable(text: $searchText)
            .tabItem {
                Label("Favourite",systemImage: "heart.fill")
            }
            NavigationView{
                ScrollView {
                    WaterfallView(WaterfallItems: WaterfallItemModels, numOfColumns: 2)
                }
                .navigationBarTitle("Ideas")
                .searchable(text: $searchText)
            }
            .tabItem {
                Label("Idea",systemImage: "photo.stack")
            }
        }
    }
}

#Preview {
    ContentView()
}

