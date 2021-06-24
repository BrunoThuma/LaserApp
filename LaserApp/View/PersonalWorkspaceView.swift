//
//  PersonalWorkspace.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

struct PersonalWorkspaceView: View {
    var workspaceName: String
    @State var postItList: [PostIt] = []
    
    var body: some View {
        HStack {
            if postItList.count <= 0 {
                Spacer()
                Text(workspaceName)
                Spacer()
            } else {
                ZStack {
                    ForEach(postItList) { obj in
                        obj
                    }
                }
            }
            Dropdown (options: ["PostIt", "Note", "YT Video"],
                      placeholder: "Add an object") { selection in
                if selection == "PostIt" {
                    postItList.append(PostIt(position: CGPoint(x: 50, y: 50)))
                }
            }
        }
    }
}

struct PersonalWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
    }
}
