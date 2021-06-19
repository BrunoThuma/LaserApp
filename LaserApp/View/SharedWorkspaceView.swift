//
//  SharedWorkspace.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import SwiftUI

struct SharedWorkspaceView: View {
    var workspaceName: String
    
    var body: some View {
        Text(workspaceName)
    }
}

struct SharedWorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        SharedWorkspaceView(workspaceName: "Shared Workspace View")
    }
}
