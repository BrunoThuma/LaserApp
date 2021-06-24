//
//  EmbeddedVideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 21/06/21.
//

import SwiftUI
import AppKit
import WebKit

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


struct EmbeddedVideoView: NSViewRepresentable {
    
    var videoString: String!
    
    func makeNSView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        DispatchQueue.main.async {
            let videoStringFormatted = videoString.replacingOccurrences(of: #"(https:\/\/www\.youtube\.com\/watch\?v=)|(https:\/\/youtu\.be\/)"#, with: "https://www.youtube.com/embed/", options: .regularExpression)
            let url = URL(string: videoStringFormatted)!
            view.load(URLRequest(url: url))
        }
        return view
    }

    func updateNSView(_ view: WKWebView, context: Context) {

    }
}

struct EmbeddedVideoView_Previews: PreviewProvider {
    static var previews: some View {
        EmbeddedVideoView(videoString: "")
    }
}

