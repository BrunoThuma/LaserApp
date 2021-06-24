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

struct KanbanCard: View {
    var data: KanbanItemData
    
    var kanbanCardColors = [
        Color("turquoise"),
        Color("deepPurple"),
        Color("pink"),
        Color("purple"),
    ]
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.system(size: 10, weight: .semibold))
                    .padding(.bottom, 5)
                
                Text(data.description)
                    .font(.system(size: 8.4, weight: .regular))
            }
            .padding(14)
        }
        .frame(width: 193, alignment: .topLeading)
        .background(kanbanCardColors[Int.random(in: 0..<4)]) // random card color
        .cornerRadius(10)
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
        Group {
            VStack(alignment: .center) {
                HStack {
                    Text(data.title)
                        .font(.system(size: 23, weight: .bold))
                    
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    ForEach(data.items) { item in
                        KanbanCard(data: item)
                            .padding(.top, 5)
                    }
                    .padding(.bottom, 14)
                }
            }
            .padding(.horizontal, 14)
            .padding(.top, 14)
        }
        .frame(width: 222, height: 245, alignment: .top)
        .background(Color("gray"))
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
