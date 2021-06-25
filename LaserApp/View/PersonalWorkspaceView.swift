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
        return HStack {
            if workspaceElementList.count <= 0 {
                Spacer()
                Text(workspaceName)
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
            }
            Dropdown (options: ["PostIt", "Note", "YT Video"],
                      placeholder: "Add an object") { selection in
                switch selection {
                case "PostIt":
                    workspaceElementList.append(
                        WorkspaceElement(
                            date: Date(),
                            position: CGPoint(x: 100, y: 100),
                            type: .postIt)
                    )
                case "Note":
                    workspaceElementList.append(
                        WorkspaceElement(
                            date: Date(),
                            position: CGPoint(x: 100, y: 100),
                            type: .note)
                    )
                case "YT Video":
                    workspaceElementList.append(
                        WorkspaceElement(
                            date: Date(),
                            position: CGPoint(x: 400, y: 400),
                            type: .video)
                    )
                default:
                    print("Default case on element creation switch")
                }
                saveScreen()
                reloadScreen()
            }
        }
        .onDisappear {
            // Serializa e salva objeto usando chave + nome do workspace
            // UserDefault + String extension
            
            saveScreen()
            
//            UserDefaults.standard.setValue(
//                try? PropertyListEncoder().encode(workspaceElementList),
//                forKey: .postItListKey + workspaceName)
        }
        .onAppear {
            reloadScreen()
        }
    }
}

struct PersonalWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
    }
}
