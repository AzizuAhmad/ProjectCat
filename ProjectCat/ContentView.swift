//
//  ContentView.swift
//  ProjectCat
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var WaterfallItems = [
        WaterfallItem(height: 350, imgString: "img_0"),
        WaterfallItem(height: 272, imgString: "img_1"),
        WaterfallItem(height: 312, imgString: "img_2"),
        WaterfallItem(height: 450, imgString: "img_3"),
        WaterfallItem(height: 554, imgString: "img_4"),
        WaterfallItem(height: 123, imgString: "img_5"),
        WaterfallItem(height: 254, imgString: "img_6"),
        WaterfallItem(height: 350, imgString: "img_7"),
        WaterfallItem(height: 234, imgString: "img_8"),
        WaterfallItem(height: 450, imgString: "img_9"),
        WaterfallItem(height: 444, imgString: "img_10"),
    ]
    
    var body: some View {
        
        TabView{
                NavigationView{
                    HomeView()
                        .navigationTitle("Simulation")
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
                NavigationStack{
                    FavoriteView(searchText: $searchText)
                        .navigationTitle("Favourite")
                }
                .searchable(text: $searchText)
                    .tabItem {
                        Label("Favourite",systemImage: "heart.fill")
                    }
                NavigationView{
                    ScrollView {
                        WaterfallView(WaterfallItems: WaterfallItems, numOfColumns: 2)
                    }
                    .navigationBarTitle("For your ideas")
                    .searchable(text: $searchText)
                }
                    .tabItem {
                        Label("Gallery",systemImage: "photo.stack")
                    }
            }
    }
}

#Preview {
    ContentView()
}

