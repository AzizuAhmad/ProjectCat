//
//  QuestionView.swift
//  Multiple-Choise
//
//  Created by MacBook Air on 04/05/24.
//

import SwiftUI

struct QuestionView: View {
    @State var question = QuestionModel(
        id: 1,
        question: "Balikan?",
        description: "Pertanyaan ini mengacu pada konteks hubungan yang serius",
        options: ["Ya", "Tidak"]
    )
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text(question.question)
                .font(.title)
                .fontWeight(.bold)
            if question.description != nil {
                Text(question.description!)
                    .foregroundColor(.gray)
            }
            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    question.selection = option
                    print(question.selection ?? "no selection")
                }, label: {
                    if (question.selection == option) {
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .shadow(color: Color.black.opacity(0.2), radius: 3)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            Text(option)
                                .foregroundColor(.black)
                        }
                    } else {
                        HStack {
                            Circle()
                                .stroke()
                                .shadow(color: Color.black.opacity(0.2), radius: 3)
                                .frame(width: 20, height: 20)
                            Text(option)
                        }
                        .foregroundColor(.secondary)
                    }
                })
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 36, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary, lineWidth: 0.3) // Menambahkan border dengan warna biru dan ketebalan 1
        )
    }
}

#Preview {
    QuestionView()
}
