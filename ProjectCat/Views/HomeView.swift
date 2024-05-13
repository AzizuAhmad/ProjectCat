//
//  HomeView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack{
            Image("Creativity-bro")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 394,height: 315)
            
            Text("Simulate your dream wall now!")
                .font(.system(size: 34,weight: .bold, design: .default))
                .padding(.top, 20)
                .padding(.leading,-23)
            
            Text("With Tocolor, you can easily match your room with the paints you need. Realize your color of wall pain expectation with simulation feature.")
                .font(.system(size: 17,weight: .regular,design: .default))
                .padding()
                .padding(.top,1)
            
            Text("More than 12.432 peoples have found their dream wall with correct choice of paint.")
                .font(.system(size: 17,weight: .semibold))
                .padding()
                .padding(.top,-30)
                .padding(.leading,-8)
            
            NavigationLink{
                PersonalizeView(QuestionManager: QuestionObject())
            } label: {
                Text("Start Simulation")
                    .font(.system(size: 17,weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 361,height: 42)
                    .background(Color("LoginColor"))
                    .cornerRadius(12)
                    .padding(.top,1)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
