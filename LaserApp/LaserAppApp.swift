//
//  LaserAppApp.swift
//  LaserApp
//
//  Created by Bruno Thuma on 18/06/21.
//

import SwiftUI

@main
struct LaserAppApp: App {
    var body: some Scene {
        WindowGroup {
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
}

