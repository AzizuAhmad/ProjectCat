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
            question: "Apakah kamu perlu proteksi esktra terhadap bangunanmu?",
            description: "Proteksi ekstra termasuk anti jamur, anti alkali, anti air, anti sinar UV",
            options: ["Tahan Anti Hujan", "Rendah Zat Kimia (Alkali)", "Anti Sinar UV", "Anti Jamur"]
        ),
        QuestionModel(
            id: 2,
            question: "Apakah anda tertarik dengan cat tembok ramah lingkungan?",
            description: "Pertanyaan ini berkaitan dengan komposisi yang ada pada cat",
            options: ["Sangat tertarik", "Tidak tertarik"]
        ),
        QuestionModel(
            id: 3,
            question: "Apakah dirumah ada anak kecil yang suka mencoret tembok?",
            options: ["Ada, bocil kaya dajjal", "Udah saya singkirkan"]
        ),
        QuestionModel(
            id: 4,
            question: "Apakah membutuhkan cat yang memiliki proteksi ketika terkena noda?",
            options: ["Butuh bgt kak", "Bodoamat apansih", "Lu siapa ngatur-ngatur"]
        ),
        QuestionModel(
            id: 5,
            question: "Diruangan mana anda ingin mengecat tembok?",
            options: ["Di kamar tidur", "Di ruang keluarga", "Di Dapur", "Di Garasi"]
        ),
        QuestionModel(
            id: 6,
            question: "Anggaran untuk pengecatan dinding ini?",
            options: ["~Rp 1.000.000", "~Rp 10.000.000", "~Rp. 100.000.000", "~Rp. 1.000.000.000"]
        ),
    ]
}
