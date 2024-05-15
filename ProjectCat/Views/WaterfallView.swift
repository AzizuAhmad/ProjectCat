//
//  WaterfallView.swift
//  ProjectCat
//
//  Created by MacBook Air on 13/05/24.
//

import SwiftUI

struct WaterfallView: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var WaterfallItems = [WaterfallItemModel]()
    }
    
    let columns: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(WaterfallItems: [WaterfallItemModel], numOfColumns: Int, spacing: CGFloat = 16, horizontalPadding: CGFloat = 16) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0 ..< numOfColumns {
            columns.append(Column())
        }
        
        // this stores the current heightf each column, so that we can find out which one is the smallest.
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        // now come the hardest part
        for WaterfallItemModel in WaterfallItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            
            columns[smallestColumnIndex].WaterfallItems.append(WaterfallItemModel)
            columnsHeight[smallestColumnIndex] += WaterfallItemModel.height
        }
        
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack (spacing: spacing) {
                    ForEach(column.WaterfallItems) { WaterfallItem in
                        NavigationLink{
                            InsightDetail()
                        } label: {
                            getItemView(WaterfallItem: WaterfallItem)
                        }
                        
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

struct getItemView: View {
    var WaterfallItemModel: WaterfallItemModel
    var body: some View {
        VStack (alignment: .leading) {
            ZStack {
                GeometryReader { reader in
                    Image(WaterfallItemModel.imgString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                }
            }
            .frame(height: WaterfallItemModel.height)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            HStack (alignment: .top) {
                Image("nipponpaint")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(WaterfallItemModel.excerpt)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    WaterfallView(WaterfallItems: [WaterfallItemModel](), numOfColumns: 2)
}
