//
//  PostItView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI

struct PostIt: View {
    @State private var position = CGPoint(x: 50, y: 50)
    @State private var text = "Write in me!"
    
    var body: some View {
        TextField (text, text: $text)
            .frame(width: 100, height: 100)
            .background(Color(.systemYellow))
            .position(position)
            .gesture(
                DragGesture()
                .onChanged({ newValue in
                    self.position = newValue.location
                })
            )
            .textFieldStyle(PlainTextFieldStyle())
    }
}

struct PostIt_Previews: PreviewProvider {
    static var previews: some View {
        PostIt()
    }
}
