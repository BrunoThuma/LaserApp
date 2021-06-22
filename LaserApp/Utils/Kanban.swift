//
//  Kanban.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 22/06/21.
//

import SwiftUI

struct KanbanItemData: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

var kanbanCardColors = [
    Color("turquoise"),
    Color("deepPurple"),
    Color("pink"),
    Color("purple"),
//    Color("yellow"),
]

struct KanbanCard: View {
    var data: KanbanItemData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.name)
                .font(.system(size: 10, weight: .semibold))
                .padding(.bottom, 5)
            
            Text(data.description)
                .font(.system(size: 8.4, weight: .regular))
        }
        .frame(width: 193, alignment: .topLeading)
        .background(kanbanCardColors[Int.random(in: 0..<4)]) // random card color
    }
}

struct KanbanPartData: Identifiable {
    let id = UUID()
    let title: String
    let items: [KanbanItemData]
}

struct KanbanPart: View {
    var data: KanbanPartData
    
    var body: some View {
        ScrollView {
            Text(data.title)
                .font(.system(size: 23, weight: .bold))
                .padding(.bottom, 10)
            
            ForEach(data.items) { item in
                KanbanCard(data: item)
            }
        }
        .frame(width: 222, height: 245, alignment: .topLeading)
        .cornerRadius(10)
    }
}

struct Kanban: View {
    var backlogPartData: KanbanPartData
    var todoPartData: KanbanPartData
    var inProgressPartData: KanbanPartData
    
    var body: some View {
        HStack {
            KanbanPart(data: backlogPartData)
                .padding(.trailing, 20)
            
            KanbanPart(data: todoPartData)
                .padding(.trailing, 20)
            
            KanbanPart(data: inProgressPartData)
        }
    }
}

//struct Kanban_Previews: PreviewProvider {
//    static var previews: some View {
//        Kanban()
//    }
//}
