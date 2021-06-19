//
//  SharedWorkspace.swift
//  LaserApp
//
//  Created by Gustavo Kumasawa on 19/06/21.
//

import Foundation

class SharedWorkspace: Identifiable {
    let id = UUID()
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
