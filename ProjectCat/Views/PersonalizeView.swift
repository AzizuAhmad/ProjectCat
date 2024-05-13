//
//  PersonalizeView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct PersonalizeView: View {
    @ObservedObject var QuestionManager: QuestionObject
    
    var body: some View {
        ScrollView {
            VStack (spacing: 8) {
                ForEach(QuestionManager.mockQuestion, id: \.id) { question in
                    QuestionView(question: question)
                        .padding(.top)
                }
                NavigationLink{
                    SimulationView()
                } label: {
                    Text("Start Simulation")
                        .font(.system(size: 17,weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 361,height: 42)
                        .background(Color("LoginColor"))
                        .cornerRadius(12)
                        .padding(.top,1)
                }
                .padding(.vertical, 8)
            }
        }
        .scrollIndicators(.hidden)
        .navigationBarTitle("Personalize")
    }
}

#Preview {
    PersonalizeView(QuestionManager: QuestionObject())
}
