
//  PostItView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.


import SwiftUI
import AppKit

extension NSTextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear //<<here clear
            drawsBackground = true
        }

    }
}

struct PostIt: View {
    @State private var position = CGPoint(x: 50, y: 50)
    @State private var text = "Write in me!"


    var body: some View {
        VStack {
        TextEditor(text: $text)
            .padding(8)
            .background(Color("yellow"))
            .foregroundColor(Color("gray"))
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            .position(position)
            .gesture(
                DragGesture()
                .onChanged({ newValue in
                    self.position = newValue.location
                })
            )
        }
    }
}

struct PostIt_Previews: PreviewProvider {
    static var previews: some View {
        PostIt()
    }
}
