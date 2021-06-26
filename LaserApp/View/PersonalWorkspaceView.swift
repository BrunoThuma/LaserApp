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
    
    func saveScreen() {
        UserDefaults.standard.setValue(
            try? PropertyListEncoder().encode(workspaceElementList),
            forKey: .elementListKey + workspaceName)
    }
    
    func reloadScreen() {
        // Guard -> condicoes separadas por virgulas, caso nil entra no else
        guard let data = UserDefaults.standard.value(forKey: .elementListKey + workspaceName) as? Data,
              let postItList = try? PropertyListDecoder().decode([WorkspaceElement].self, from: data) else  {
            
            self.workspaceElementList = []
            return
        }
        self.workspaceElementList = postItList
    }
    
    var body: some View {
        return VStack {
            if workspaceElementList.count <= 0 {
                Spacer()
                Text(workspaceName + workspaceElementList.count.description)
                Spacer()
            } else {
                ZStack {
                    ForEach(Array(workspaceElementList.enumerated()), id: \.0) { i, element in
                        switch element.type {
                        case .postIt:
                            PostItView(workspaceElement: $workspaceElementList[i])
                        case .note:
                            NotesView(workspaceElement: $workspaceElementList[i])
                        case .video:
                            VideoView(workspaceElement: $workspaceElementList[i])
                        }
                    }
                }
            }// HStack
            HStack {
                let miniatureNamesList: [String] = ["postItMiniature", "notesMiniature", "videoEmbedMiniature"]
                
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
                        default:
                          print("Default case on toolbar switch")
                        }
                        saveScreen()
                        reloadScreen()
                    }) {
                        Image(miniatureName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            
                    }.buttonStyle(PlainButtonStyle()) // Button
                }// ForEach
            } // HStack
            .background(Color("black"))
            .cornerRadius(8)
            .padding(.horizontal, 50)
            .padding(.bottom, 15)
//            .frame(maxWidth: .infinity)
        } // VStack
        .onDisappear {
            saveScreen()
            
        }
        .onAppear { reloadScreen() }
    }
}

struct PersonalWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
    }
}
