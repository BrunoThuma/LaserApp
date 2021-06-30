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
    var data: PersonalWorkspace
    
    @State var workspaceName: String = ""
    @State var workspaceElementList: [WorkspaceElement] = []
    
    var onTitleChange: (String, UUID) -> Void = {_, _ in ()}
    
    
    func saveScreen(workspaceElementeListUpdated: [WorkspaceElement]) {
        UserDefaults.standard.setValue(
            try? PropertyListEncoder().encode(workspaceElementeListUpdated),
            forKey: .elementListKey + data.name)
    }
    
    func reloadScreen() {
        // Guard -> condicoes separadas por virgulas, caso nil entra no else
        guard let data = UserDefaults.standard.value(forKey: .elementListKey + data.name) as? Data,
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
    
    func countElements() -> Int {
        var count: Int = 0
        for element in workspaceElementList {
            if element.showElement{
                count += 1
            }
        }
        return count
    }
    
    var body: some View {
        return ZStack {
            VStack {
                HStack{
                    TextField(data.name, text: $workspaceName)
                        .font(Font.system(size: 15))
                        .textFieldStyle(PlainTextFieldStyle())
                        .fixedSize()
                        .padding(5)
                        .background(Color("pink"))
                        .cornerRadius(18)
                        .padding()
                        .onChange(of: workspaceName) { newValue in
                            onTitleChange(newValue, data.id)
                        }
                        
                    Spacer()
                }
                Spacer()
            }
            
            
            if countElements() != 0 {
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
                                if !workspaceElementList[i].fixed {
                                    self.workspaceElementList[i].position = newValue.location
                                }
                            })
                        )
                        
                    }
                }
            } else {
                HStack{
                    VStack(alignment:.leading){
                        Text("Nothing here...")
                            .font(.title)
                            .bold()
                        Text("No more drama llama, start \nby adding some components")
                            .font(.body)
                    }
                    Image("emptyWorkspaceLhama")
                }
                
                
            }
            
            VStack {
                Spacer()
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
                                      position: CGPoint(x: 400, y: 400),
                                      type: .postIt)
                                )
                            case "notesMiniature":
                                workspaceElementList.append(
                                  WorkspaceElement(
                                      date: Date(),
                                      position: CGPoint(x: 400, y: 400),
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
            }
            
            HStack{
                Spacer()
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
                                             text: "Ler texto 'User Experience and Experience Design', Marc Hassenahl",
                                             type: .postIt
                            )
                        )
                    default:
                        print(mockup + " not recognizable as shared material type")
                    }
                }.padding()
                .padding()
            }
        }
        .onDisappear {
            saveScreen(workspaceElementeListUpdated: workspaceElementList)
        }
        .onAppear {
            reloadScreen()
            workspaceName = data.name
        }
    }
}

//struct PersonalWorkspaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
//    }
//}
