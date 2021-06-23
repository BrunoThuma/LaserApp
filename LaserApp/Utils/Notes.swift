//
//  NotesView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI

struct NotesView: View {
    @State private var position = CGPoint(x: 50, y: 50)
    @State private var dateTime = Date()
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
        Text("Jonas")
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
