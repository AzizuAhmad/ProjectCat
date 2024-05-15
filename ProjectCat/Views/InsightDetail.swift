//
//  InsightDetail.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import SwiftUI

struct InsightDetail: View {
    
    
    let columns: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible())
                               
    ]
    
    var body: some View {
        VStack{
            Image("insightImage")
                .resizable()
                .frame(width: 364,height: 450)
                .padding(.bottom,10)
            
            ScrollView(.vertical){
                LazyVGrid(columns: columns,alignment: .center){
                    ForEach(1...10,id:\.self){i in
                        VStack{
                            Rectangle()
                                .frame(width: 172,height: 100)
                                .foregroundColor(.brown)
                                .cornerRadius(10)
                            
                            Text("Code : #D9C5F6 ")
                                .font(.system(size: 17,weight: .regular))
                                .padding(.leading,-20)
                                .multilineTextAlignment(.leading)
//                                .border(Color.black)
                            Text("Name : Sakura")
                                .font(.system(size: 17,weight: .regular))
                                .padding(.leading,-36)
                                .multilineTextAlignment(.leading)
//                                .border(Color.black)

                        }
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle("Your Colors")
    }
}

#Preview {
    InsightDetail()
}
