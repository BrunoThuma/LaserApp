//
//  EmbeddedVideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 21/06/21.
//

import SwiftUI
import AppKit
import WebKit

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

