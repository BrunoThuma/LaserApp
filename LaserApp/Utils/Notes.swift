//
//  NotesView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI

struct NotesView: View {
    @Binding var workspaceElement: WorkspaceElement
//    @State private var position = CGPoint(x: 50, y: 50)
//    @State private var dateTime = Date()
//    @State private var text = "Write in me!"
    
    var body: some View {
        TextField (workspaceElement.content, text: $workspaceElement.content)
            .frame(width: 100, height: 100)
            .background(Color(.systemGray))
            .position(workspaceElement.position)
            .gesture(
                DragGesture()
                .onChanged({ newValue in
                    self.workspaceElement.position = newValue.location
                })
            )
    }
}

//struct NotesView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesView(
//            workspaceElement: WorkspaceElement(
//                date: Date(),
//                position: CGPoint(x: 100, y: 100),
//                type: .note)
//        )
//    }
//}
