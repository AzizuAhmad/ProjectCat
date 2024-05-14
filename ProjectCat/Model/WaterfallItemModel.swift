//
//  WaterfallItemModel.swift
//  ProjectCat
//
//  Created by MacBook Air on 14/05/24.
//

import Foundation

struct WaterfallItemModel: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
    let excerpt: String
}
