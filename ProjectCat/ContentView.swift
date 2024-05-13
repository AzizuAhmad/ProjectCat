//
//  ContentView.swift
//  ProjectCat
//
//  Created by MacBook Air on 06/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    

    
    var body: some View {
        
        TabView{
                NavigationView{
                    HomeView2()
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
                        Label("Simulation",systemImage: "house")
                    }
                NavigationStack{
                    FavoriteView(searchText: $searchText)
                        .navigationTitle("Favourite")
                }
                .searchable(text: $searchText)
                    .tabItem {
                        Label("Favourite",systemImage: "star")
                    }
                NavigationView{
                    GalleryView()
                        .navigationTitle("Idea")
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

