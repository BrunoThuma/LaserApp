//
//  PersonalWorkspace.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

struct PersonalWorkspaceView: View {
    var workspaceName: String
    
    var body: some View {
        Text(workspaceName)
    }
}

struct PersonalWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalWorkspaceView(workspaceName: "Personal Workspace View")
    }
}
