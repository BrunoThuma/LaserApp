
//
//  HomeView.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

let kanbanBacklogSampleData = KanbanPartData(title: "Backlog", items: [
    KanbanItemData(name: "Home screen design", description: "Make Home screen design with all Figma components, include interaction with the prototype. Make all conform to the color pallete."),
    KanbanItemData(name: "Markdown conversion", description: "Convert Markdown format."),
    KanbanItemData(name: "Table View", description: ""),
]);

let kanbanTodoSampleData = KanbanPartData(title: "To do", items: [
    KanbanItemData(name: "Audio recording in note", description: "Show audio in note and playback UI."),
    KanbanItemData(name: "Bookmark in note", description: "Show rich link UI in a note, and feature to render website screenshot."),
    KanbanItemData(name: "Analogic Simulation", description: "Simulate an amplification circuit."),
]);

let kanbanInProgressSampleData = KanbanPartData(title: "Ongoing", items: [
    KanbanItemData(name: "Mobile view", description: "Functions for both web responsive and native apps. Note: iOs will need unique share icons."),
    KanbanItemData(name: "Desktop view", description: "PWA for website and native apps. Note: Mac will need unique share icons."),
]);

let personalWorkspaceCardSampleData = [
    PersonalWorkspaceCardData(
        title: "eletromag 1",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "audio", color: "deepPurple"),
            HashtagData(title: "read", color: "turquoise"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "ed design",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "audio", color: "deepPurple"),
            HashtagData(title: "read", color: "turquoise"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "interfaces",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "movie", color: "yellow"),
            HashtagData(title: "audio", color: "deepPurple"),
        ]
    ),
    PersonalWorkspaceCardData(
        title: "ux",
        hashtags: [
            HashtagData(title: "video", color: "yellow"),
            HashtagData(title: "podcast", color: "purple"),
            HashtagData(title: "read", color: "turquoise"),
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
                                    addPersonalWorkspace(PersonalWorkspace(name: "Editorial Design"))
                                }) {
                                    Label("Editorial Design", systemImage: "globe")
                                }
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "Interface Design"))
                                }) {
                                    Label("Interface Design", systemImage: "globe")
                                }
                                Button(action: {
                                    addPersonalWorkspace(PersonalWorkspace(name: "Academic Read and Write"))
                                }) {
                                    Label("Academic Read and Write", systemImage: "globe")
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

