//
//  ContentView.swift
//  LaserApp
//
//  Created by Bruno Thuma on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var personalWorkspaces: [PersonalWorkspace] = []
    @State var sharedWorkspaces: [SharedWorkspace] = []
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    func addPersonalWorkspace(newWorkspace: PersonalWorkspace) {
        personalWorkspaces.append(newWorkspace)
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomeView(addPersonalWorkspace: addPersonalWorkspace)) {
                    Text("􀎞 Home")
                        .font(.system(size: 12.82, weight: .bold))
                }
                Section(header: Text("Sua Workspace")) {
                    ForEach(personalWorkspaces) { workspace in
                        NavigationLink(destination: PersonalWorkspaceView(workspaceName: workspace.name)) {
                            Text("􀫗 \(workspace.name)")
                                .font(.system(size: 12.82, weight: .regular))
                        }
                    }
                }
                Section(header: Text("Workspaces Compartilhadas")) {
                    ForEach(sharedWorkspaces) { workspace in
                        NavigationLink(destination: SharedWorkspaceView(workspaceName: workspace.name)) {
                            Text("􀆪 \(workspace.name)")
                                .font(.system(size: 12.82, weight: .regular))
                        }
                    }
                }
            }
            
            HomeView(addPersonalWorkspace: addPersonalWorkspace) // A placeholder to show before selection.
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.left")
                })
            }
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
