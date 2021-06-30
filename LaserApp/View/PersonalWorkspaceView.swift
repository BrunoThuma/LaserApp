//
//  PersonalWorkspace.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

extension String {
    static let elementListKey = "elementList"
}

struct PersonalWorkspaceView: View {
    var workspaceName: String
    @State var workspaceElementList: [WorkspaceElement] = []
    
    func saveScreen(workspaceElementeListUpdated: [WorkspaceElement]) {
        UserDefaults.standard.setValue(
            try? PropertyListEncoder().encode(workspaceElementeListUpdated),
            forKey: .elementListKey + workspaceName)
    }
    
    func reloadScreen() {
        // Guard -> condicoes separadas por virgulas, caso nil entra no else
        guard let data = UserDefaults.standard.value(forKey: .elementListKey + workspaceName) as? Data,
              let elementList = try? PropertyListDecoder().decode([WorkspaceElement].self, from: data) else  {
            
            self.workspaceElementList = []
            return
        }
        self.workspaceElementList = elementList
    }
    
    func deleteElement(id: UUID){
        var workspaceElementListUpdated = workspaceElementList
        let index = workspaceElementList.firstIndex(where: {item in
            if item.id == id {
                return true
            }
            return false
        })
        
        workspaceElementListUpdated.remove(at: index!)
        saveScreen(workspaceElementeListUpdated: workspaceElementListUpdated)
        workspaceElementList[index!].showElement = false
    }
    
    var body: some View {
        return HStack {
            VStack {
            if workspaceElementList.count <= 0 {
                Spacer()
                Text(workspaceName)
                Spacer()
            } else {
                ZStack {
                    ForEach(Array(workspaceElementList.enumerated()), id: \.0) { i, element in
                        Group {
                            if element.showElement {
                                switch element.type {
                                case .postIt:
                                    PostItView(workspaceElement: $workspaceElementList[i], deleteItem: deleteElement)
                                case .note:
                                    NotesView(workspaceElement: $workspaceElementList[i], deleteItem: deleteElement)
                                case .video:
                                    VideoView(workspaceElement: $workspaceElementList[i], deleteItem: deleteElement)
                                case .webLink:
                                    WebLinkView(workspaceElement: $workspaceElementList[i], deleteItem: deleteElement)
                                case .image:
                                    ImageView(workspaceElement: $workspaceElementList[i], deleteItem: deleteElement)
                                }
                            }
                        }
                        .gesture(
                            DragGesture()
                            .onChanged({ newValue in
                                workspaceElementList[i].zIndex = workspaceElementList.highestZIndex+1
                                if !workspaceElementList[i].fixed{
                                    self.workspaceElementList[i].position = newValue.location
                                }
                            })
                        )
                        
                    }
                }
            }// HStack
            HStack {
                let miniatureNamesList: [String] = ["postItMiniature", "notesMiniature", "imageMiniature", "videoEmbedMiniature", "webLinkMiniature"]
                
                Text("Add Stuff:")
                    .padding(.horizontal, 10)
                ForEach(miniatureNamesList, id: \.self) { miniatureName in
                    Button(action: {
                        switch miniatureName {
                        case "postItMiniature":
                            workspaceElementList.append(
                              WorkspaceElement(
                                  date: Date(),
                                  position: CGPoint(x: 100, y: 100),
                                  type: .postIt)
                            )
                        case "notesMiniature":
                            workspaceElementList.append(
                              WorkspaceElement(
                                  date: Date(),
                                  position: CGPoint(x: 100, y: 100),
                                  type: .note)
                            )
                        case "videoEmbedMiniature":
                            workspaceElementList.append(
                              WorkspaceElement(
                                  date: Date(),
                                  position: CGPoint(x: 400, y: 400),
                                  type: .video)
                            )
                        case "imageMiniature":
                            workspaceElementList.append(
                              WorkspaceElement(
                                  date: Date(),
                                  position: CGPoint(x: 400, y: 400),
                                  type: .image)
                            )
                        case "webLinkMiniature":
                            workspaceElementList.append(
                              WorkspaceElement(
                                  date: Date(),
                                  position: CGPoint(x: 400, y: 400),
                                  type: .webLink)
                            )
                        default:
                          print("Default case on toolbar switch")
                        }
                        saveScreen(workspaceElementeListUpdated: workspaceElementList)
                        reloadScreen()
                    }) {
                        switch miniatureName {
                        case "videoEmbedMiniature":
                            Image(systemName: "play.rectangle.fill")
                                .font(.system(size: 20).bold())
                                .padding(.trailing, 10)
                        case "imageMiniature":
                            Image(systemName: "photo.fill")
                                .font(.system(size: 20).bold())
                                .padding(.trailing, 10)
                        case "webLinkMiniature":
                            Image(systemName: "link")
                                .font(.system(size: 20).bold())
                                .padding(.trailing, 10)
                        default:
                            Image(miniatureName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                        }
                            
                    }.buttonStyle(PlainButtonStyle()) // Button
                }// ForEach
            } // HStack
            .background(Color("black"))
            .cornerRadius(8)
            .padding(.horizontal, 50)
            .padding(.bottom, 15)
        } // VStack
            RightSideItems(type: .workspace) { mockup in
                switch mockup {
                case "imageSample":
                    workspaceElementList.append(
                        WorkspaceElement(date: Date(),
                                         position: CGPoint(x: 50, y: 50),
                                         text: "imageSample",
                                         type: .image
                        )
                    )
                case "postitSample":
                    workspaceElementList.append(
                        WorkspaceElement(date: Date(),
                                         position: CGPoint(x: 50, y: 50),
                                         text: "Ler texto 'User Experience and Experience Design', Marc Hassenahl'",
                                         type: .postIt
                        )
                    )
                default:
                    print(mockup + " not recognizable as shared material type")
                }
            }
        }
        .onDisappear {
            saveScreen(workspaceElementeListUpdated: workspaceElementList)
        }
        .onAppear { reloadScreen() }
    }
}

struct PersonalWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
    }
}
