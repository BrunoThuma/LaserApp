//
//  ContentView.swift
//  LaserApp
//
//  Created by Bruno Thuma on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    var personalWorkspaces: [PersonalWorkspace] = []
    var sharedWorkspaces: [SharedWorkspace] = []
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Sua Workspace")) {
                    NavigationLink(destination: HomeView()) {
                        Text("􀎞 Home").bold()
                    }
                    ForEach(personalWorkspaces) { workspace in
                        NavigationLink("􀫗 \(workspace.name)", destination: PersonalWorkspaceView(workspaceName: workspace.name))
                    }
                }
                Section(header: Text("Workspaces Compartilhadas")) {
                    ForEach(sharedWorkspaces) { workspace in
                        NavigationLink("􀤆 \(workspace.name)", destination: SharedWorkspaceView(workspaceName: workspace.name))
                    }
                }
            }
            
            HomeView() // A placeholder to show before selection.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            personalWorkspaces: [
                PersonalWorkspace(name: "eletromag aula 1"),
                PersonalWorkspace(name: "design ed - gonzatto"),
                PersonalWorkspace(name: "interfaces - marcos"),
                PersonalWorkspace(name: "ux - gonzatto"),
            ],
            sharedWorkspaces: [
                SharedWorkspace(name: "Eletromagnetismo"),
                SharedWorkspace(name: "Design Editorial"),
                SharedWorkspace(name: "Design de Interface"),
                SharedWorkspace(name: "Leitura e Escrita"),
                SharedWorkspace(name: "Redes de Computadores"),
            ]
        ) // Exemplo de Workspaces
    }
}
