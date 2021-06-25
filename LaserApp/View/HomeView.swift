
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
            KanbanItemData(name: "Design tela Home", description: "Fazer o design da tela Home com todos os componentes criados no Figma, incluir ações de interação com o protótipo. Estar em conformidade com a paleta de cores."),
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
            VStack(alignment: .leading) {
                Text("Dashboard")
                    .font(.system(size: 48, weight: .regular))
                    .padding(.vertical, 55)
                
                Kanban(backlogPartData: kanbanBacklogSampleData, todoPartData: kanbanTodoSampleData, inProgressPartData: kanbanInProgressSampleData)
            }
        }
    }
    
    struct PersonalWorkspaceSection: View {
        let columns: [GridItem] =
                 Array(repeating: .init(.flexible()), count: 2)
        
        let personalWorkspaceCardSampleData = [
            PersonalWorkspaceCardData(
                title: "interface - marcus",
                hashtags: [
                    HashtagData(title: "video", color: "yellow"),
                    HashtagData(title: "podcast", color: "purple"),
                    HashtagData(title: "videoaula", color: "yellow"),
                    HashtagData(title: "audio", color: "yellow"),
                ]
            ),
            PersonalWorkspaceCardData(
                title: "interface - marcus",
                hashtags: [
                    HashtagData(title: "video", color: "yellow"),
                    HashtagData(title: "podcast", color: "purple"),
                    HashtagData(title: "videoaula", color: "yellow"),
                    HashtagData(title: "audio", color: "yellow"),
                ]
            ),
            PersonalWorkspaceCardData(
                title: "interface - marcus",
                hashtags: [
                    HashtagData(title: "video", color: "yellow"),
                    HashtagData(title: "podcast", color: "purple"),
                    HashtagData(title: "videoaula", color: "yellow"),
                    HashtagData(title: "audio", color: "yellow"),
                ]
            ),
            PersonalWorkspaceCardData(
                title: "interface - marcus",
                hashtags: [
                    HashtagData(title: "video", color: "yellow"),
                    HashtagData(title: "podcast", color: "purple"),
                    HashtagData(title: "videoaula", color: "yellow"),
                    HashtagData(title: "audio", color: "yellow"),
                ]
            ),
            PersonalWorkspaceCardData(
                title: "interface - marcus",
                hashtags: [
                    HashtagData(title: "video", color: "yellow"),
                    HashtagData(title: "podcast", color: "purple"),
                    HashtagData(title: "videoaula", color: "yellow"),
                    HashtagData(title: "audio", color: "yellow"),
                ]
            ),
        ]
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("Workspaces Pessoais")
                        .font(.system(size: 48, weight: .regular))
                        .padding(.vertical, 55)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: columns, alignment: .leading, spacing: 30) {
                    ForEach(personalWorkspaceCardSampleData) { item in
                        PersonalWorkspaceCard(data: item) {
                            print("workspace clicked")
                        }
                    }
                }
                .frame(width: 710)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Header(searchText: $searchText, searchTag: $searchTag, tagOptions: ["veja", "escute", "anote", "pratique"])
                    .offset(x: 0, y: 0)
                 
                Dashboard()
                
                PersonalWorkspaceSection()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 30)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("background"))
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

