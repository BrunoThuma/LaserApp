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
                    PersonalWorkspace(name: "eletromag 1"),
                    PersonalWorkspace(name: "ed design"),
                    PersonalWorkspace(name: "interfaces"),
                    PersonalWorkspace(name: "ux"),
                ],
                sharedWorkspaces: [
                    SharedWorkspace(name: "UX Design"),
                    SharedWorkspace(name: "Editorial Design"),
                    SharedWorkspace(name: "Interface Design"),
                    SharedWorkspace(name: "Academic Read and Write"),
                ]
            ) // Exemplo de Workspaces
        }
    }
}

