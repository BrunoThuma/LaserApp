
//
//  HomeView.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @State var searchTag = ""
    
    struct Header: View {
        @Binding var searchText: String
        @Binding var searchTag: String
        
        var tagOptions: [String]
        
        var body: some View {
            HStack(alignment: .center) {
                SearchBar(onTextChange: { text in
                    searchText = text
                })
                    .padding(.trailing, 30)
                Dropdown(options: tagOptions, placeholder: "Filtrar") { tag in
                    searchTag = tag
                }
            }
        }
    }

    struct Dashboard: View {
        let kanbanBacklogSampleData = KanbanPartData(title: "Backlog", items: [
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
        ]);

        let kanbanTodoSampleData = KanbanPartData(title: "To do", items: [
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
        ]);

        let kanbanInProgressSampleData = KanbanPartData(title: "Em progresso", items: [
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
            KanbanItemData(name: "Simulação analógica", description: "Simular o circuito X"),
        ]);
        
        var body: some View {
            Group {
                Text("Dashboard")
                    .font(.system(size: 48, weight: .regular))
                    .padding(.vertical, 55)
                
                Kanban(backlogPartData: kanbanBacklogSampleData, todoPartData: kanbanTodoSampleData, inProgressPartData: kanbanInProgressSampleData)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Header(searchText: $searchText, searchTag: $searchTag, tagOptions: ["veja", "escute", "anote", "pratique"])
             
            Dashboard()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 30)
        .padding(.vertical, 30)
        .background(Color("background"))
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

