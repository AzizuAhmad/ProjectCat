//
//  QuestionObject.swift
//  Multiple-Choise
//
//  Created by MacBook Air on 04/05/24.
//

import Foundation

class QuestionObject : ObservableObject {
    @Published var mockQuestion = [
        QuestionModel(
            id: 1,
            question: "Apakah Anda Siap?",
            description: "Pertanyaan ini mengacu pada konteks hubungan yang serius",
            options: ["Ya", "Tidak"]
        ),
        QuestionModel(
            id: 2,
            question: "Apakah benar kids?",
            description: "Pertanyaan ini bermaksud untuk mengkonfirmasi pertanyaan sebelumnya",
            options: ["Ya", "Tidak"]
        ),
        QuestionModel(
            id: 3,
            question: "Balikan?",
            description: "Pertanyaan ini mengacu pada konteks hubungan yang serius",
            options: ["Ya", "Tidak"]
        ),
        QuestionModel(
            id: 4,
            question: "Apakah benar kids?",
            description: "Pertanyaan ini bermaksud untuk mengkonfirmasi pertanyaan sebelumnya",
            options: ["Ya", "Tidak"]
        ),
        QuestionModel(
            id: 5,
            question: "Balikan?",
            description: "Pertanyaan ini mengacu pada konteks hubungan yang serius",
            options: ["Ya", "Tidak"]
        ),
        QuestionModel(
            id: 6,
            question: "Apakah benar kids?",
            description: "Pertanyaan ini bermaksud untuk mengkonfirmasi pertanyaan sebelumnya",
            options: ["Ya", "Tidak"]
        ),
    ]
}
