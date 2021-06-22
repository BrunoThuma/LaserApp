//
//  EmbeddedVideo.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 21/06/21.
//

import Foundation

class EmbeddedVideo: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
}
