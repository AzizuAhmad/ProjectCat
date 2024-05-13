//
//  SimulationView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct SimulationView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: DetailProductView()) {
                Text("Klik disini untuk ke halaman detail")
            }
            .padding(.top)
        }
    }
}

#Preview {
    SimulationView()
}
