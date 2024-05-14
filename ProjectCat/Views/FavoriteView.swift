//
//  FavoriteView.swift
//  ProjectCat
//
//  Created by MacBook Air on 07/05/24.
//

import SwiftUI

struct FavoriteView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible())
                               
    ]
    
    let favoriteItems = [
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Nippon Paint", typePaintFav: "Harbor Gray", desFav: "Elastex Waterproof 3-in-1", textColorFav: "#A8C4BC"),
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Delux", typePaintFav: "Cyan", desFav: "anti jamur", textColorFav: "#999111"),
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Nippon Paint", typePaintFav: "Harbor Gray", desFav: "Elastex Waterproof 3-in-1", textColorFav: "#A8C4BC"),
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Delux", typePaintFav: "Cyan", desFav: "anti jamur", textColorFav: "#999111"),
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Nippon Paint", typePaintFav: "Harbor Gray", desFav: "Elastex Waterproof 3-in-1", textColorFav: "#A8C4BC"),
            FavoriteItem(imageFav: "paintCat", brandFav: "nipponpaint", brandText: "Delux", typePaintFav: "Cyan", desFav: "anti jamur", textColorFav: "#999111"),
            
            // Add more items here...
        ]

//    get variable from ContentView file
    @Binding var searchText:String
    
    var filteredItems: [FavoriteItem] {
            if searchText.isEmpty {
                return favoriteItems
            } else {
                return favoriteItems.filter {
                    $0.typePaintFav.localizedCaseInsensitiveContains(searchText) ||
                    $0.brandText.localizedStandardContains(searchText) ||
                    $0.desFav.localizedStandardContains(searchText)

                }
            }
        }

    
     
    var body: some View {
        VStack{
            ScrollView(.vertical){
                LazyVGrid(columns: columns){
                    
                    ForEach(filteredItems,id:\.self ){ i in
                       
                        layoutView(imageFav: i.imageFav,
                                   brandFav: i.brandFav,
                                   brandText: i.brandText,
                                   typePaintFav: i.typePaintFav,
                                   desFav: i.desFav,
                                   textColorFav: i.textColorFav)
                        
                    }
                }
                
            }
        }
        .background(Color("page"))
    }
}

#Preview {
    FavoriteView(searchText: .constant(""))
}

struct FavoriteItem: Identifiable,Hashable {
    let id = UUID() // Add this line to conform to Identifiable
    
    
    let imageFav: String
    let brandFav: String
    let brandText: String
    let typePaintFav: String
    let desFav: String
    let textColorFav: String
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

struct layoutView: View {
    
    var imageFav: String
    var brandFav: String
    var brandText: String
    var typePaintFav: String
    var desFav: String
    var textColorFav: String
    
    var body: some View {
        
        NavigationLink{
            DetailProductViewFav()
        }label: {
            VStack{
                Image(imageFav)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 173,height: 130)
                    .background(Color("FavoritCat"))
                VStack{
                    HStack{
                        Image(brandFav)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22)
                        Text(brandText)
                            .font(.system(size: 17,weight: .regular,design: .default))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 150,alignment: .leading)
    //                                .border(Color.black)
                    .padding(.bottom,-4)

                    Text(typePaintFav)
                        .font(.system(size: 22,weight: .bold,design: .default))
                        .foregroundStyle(.black)
                        .frame(width: 150,alignment: .leading)
                        .padding(.bottom,1)

                    Text(desFav)
                        .font(.system(size: 12,weight: .regular,design: .default))
                        .foregroundStyle(Color("detailfavorit"))
                        .frame(width: 150,alignment: .leading)
                        .padding(.bottom,1)

                    HStack{
                        Text(textColorFav)
                            .font(.system(size: 17,weight: .regular,design: .default))
                            .foregroundStyle(Color("LoginColor"))
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(Color("LoginColor"))
                            .font(.system(size: 12.36,weight: .regular))
                            .padding(.leading,-4)
                    }
                    
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 173,height: 130)
                .background(.white)
                .padding(.top,-12)
                
            }
            .cornerRadius(10)
    //                        .border(Color.black)
        }
        
    }
}
