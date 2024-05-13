//
//  WaterfallView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct WaterfallItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
}

struct WaterfallView: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var WaterfallItems = [WaterfallItem]()
    }
    
    let columns: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(WaterfallItems: [WaterfallItem], numOfColumns: Int, spacing: CGFloat = 16, horizontalPadding: CGFloat = 16) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0 ..< numOfColumns {
            columns.append(Column())
        }
        
        // this stores the current heightf each column, so that we can find out which one is the smallest.
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        // now come the hardest part
        for WaterfallItem in WaterfallItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            
            columns[smallestColumnIndex].WaterfallItems.append(WaterfallItem)
            columnsHeight[smallestColumnIndex] += WaterfallItem.height
        }
        
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack (spacing: spacing) {
                    ForEach(column.WaterfallItems) { WaterfallItem in
                        getItemView(WaterfallItem: WaterfallItem)
                        
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

struct getItemView: View {
    var WaterfallItem: WaterfallItem
    var body: some View {
        ZStack {
            GeometryReader { reader in
                Image(WaterfallItem.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            }
        }
        .frame(height: WaterfallItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    WaterfallView(WaterfallItems: [WaterfallItem](), numOfColumns: 2)
}
