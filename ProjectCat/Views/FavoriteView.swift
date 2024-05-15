//
//  FavoriteView.swift
//  ProjectCat
//
//  Created by MacBook Air on 07/05/24.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var paintFav: ProductObject
    
    let columns: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible())
                               
    ]
    

//    get variable from ContentView file

     
    var body: some View {
        VStack{
            ScrollView(.vertical){
                LazyVGrid(columns: columns){

                    if self.paintFav.mockProduct.filter({ $0.favourite == true }).first != nil{
                        ForEach(self.$paintFav.mockProduct.filter({$0.favourite.wrappedValue == true})){product in
                            layoutView(
                                imageFav: product.imageFav.wrappedValue, brandFav: product.imageBrand.wrappedValue, brandText: product.brand.wrappedValue, typePaintFav: product.name.wrappedValue, desFav: product.type.wrappedValue, textColorFav: product.hex.wrappedValue
                            )
                            
                        }
                    }

                }
                
            }
        }
        .background(Color("page"))
    }
}

#Preview {
    FavoriteView(paintFav: ProductObject())
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
                        .font(.system(size: 20,weight: .bold,design: .default))
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
