//
//  HomeView2.swift
//  ProjectCat
//
//  Created by MacBook Air on 12/05/24.
//

import SwiftUI

struct HomeView2: View {
    var body: some View {
        
        VStack{
            Image("SimulationImage2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 394,height: 315)
//                .padding(.top,30)
//                .border(Color.black)
            
            Text("Simulate your dream wall now!")
                .font(.system(size: 34,weight: .bold, design: .default))
//                .border(Color.black)
                .padding(.top, 20)
                .padding(.leading,-23)
//                .border(Color.black)
            
            Text("With Tocolor, you can easily match your room with the paints you need. Realize your color of wall pain expectation with simulation feature.")
                .font(.system(size: 17,weight: .regular,design: .default))
//                .border(Color.black)
                .padding()
                .padding(.top,1)
            
            Text("More than 12.432 peoples have found their dream wall with correct choice of paint.")
                .font(.system(size: 17,weight: .semibold))
//                .border(Color.black)
                .padding()
                .padding(.top,-30)
                .padding(.leading,-8)
            
            NavigationLink{
                
            }label: {
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
    HomeView2()
}
