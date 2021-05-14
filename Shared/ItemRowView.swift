//
//  ItemRowView.swift
//  SwiftUI-CoreData-WithEase
//
//  Created by Andy Nadal on 5/14/21.
//

import SwiftUI

struct ItemRowView: View {
    var item: Item
    
    var body: some View {
        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        Previewing(\.item) { item in
            ItemRowView(item: item)
        }
    }
}

