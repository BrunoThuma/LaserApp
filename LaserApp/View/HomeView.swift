
//
//  HomeView.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

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

let kanbanInProgressSampleData = KanbanPartData(title: "Ongoing", items: [
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

let personalWorkspaceCardSampleData = [
    PersonalWorkspaceCardData(
        title: "eletromag aula 1",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "videoaula", color: "yellow"),
            HashtagData(title: "audio", color: "deepPurple"),
            HashtagData(title: "leia", color: "turquoise"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "design ed - gonzatto",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "videoaula", color: "yellow"),
            HashtagData(title: "audio", color: "deepPurple"),
            HashtagData(title: "leia", color: "turquoise"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "interface - marcos",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "videoaula", color: "yellow"),
            HashtagData(title: "audio", color: "deepPurple"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "ux - gonzatto",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "leia", color: "turquoise"),
        ]
    ),
]



struct HomeView: View {
    @State var searchText = ""
    @State var searchTag = ""
    
    var addPersonalWorkspace: (PersonalWorkspace) -> Void = {_ in ()}
    
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
                Dropdown(options: tagOptions, placeholder: "Filter") { tag in
                    searchTag = tag
                }
            }
        }
    }

    struct DashboardSection: View {
        var backlogData: KanbanPartData
        var todoData: KanbanPartData
        var inProgressData: KanbanPartData
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Dashboard")
                    .font(.system(size: 48, weight: .regular))
                    .padding(.vertical, 55)
                
                Kanban(backlogPartData: backlogData, todoPartData: todoData, inProgressPartData: inProgressData)
            }
        }
    }
    
    struct PersonalWorkspaceSection: View {
        var data: [PersonalWorkspaceCardData]
        
        @State var menuIsOnHover = false
        
        let columns: [GridItem] =
                 Array(repeating: .init(.flexible()), count: 2)
        
        var addPersonalWorkspace: (PersonalWorkspace) -> Void = {_ in ()}
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Personal Workspaces")
                        .font(.system(size: 48, weight: .regular))
                        .padding(.vertical, 55)
                    
                        Menu {
                            Menu {
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "UX Design"))
                                }) {
                                    Label("UX Design", systemImage: "globe")
                                }
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "Design Editorial"))
                                }) {
                                    Label("Design Editorial", systemImage: "globe")
                                }
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "Design de Interfaces"))
                                }) {
                                    Label("Design de Interfaces", systemImage: "globe")
                                }
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "Leitura e Escrita Acadêmica"))
                                }) {
                                    Label("Leitura e Escrita Acadêmica", systemImage: "globe")
                                }
                            } label: {
                                Label("Duplicate from", systemImage: "square.and.arrow.up")
                            }
                            .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                            .fixedSize()
                            
                            Button(action: {
                                addPersonalWorkspace(PersonalWorkspace(name: "New Workspace"))
                            }, label: {
                                Label("Create new workspace", systemImage: "globe")
                            })
                            
                        } label: {
                            Text(menuIsOnHover ? "􀁍" : "􀁌")
                                .font(.system(size: 28, weight: .regular))
                        }
                        .onHover { over in
                            menuIsOnHover = over
                        }
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 3)
                        .padding(.trailing,5)
//                    }
                    
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
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Header(searchText: $searchText, searchTag: $searchTag, tagOptions: ["veja", "escute", "anote", "pratique"])
                        .offset(x: 0, y: 0)
                     
                    DashboardSection(backlogData: kanbanBacklogSampleData, todoData: kanbanTodoSampleData, inProgressData: kanbanInProgressSampleData)
                    
                    PersonalWorkspaceSection(data: personalWorkspaceCardSampleData, addPersonalWorkspace: addPersonalWorkspace)
                }
                
                Spacer()
                
                RightSideItems()
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

