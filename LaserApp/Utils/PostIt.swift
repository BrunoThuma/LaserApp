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

struct PostItView: View {
    @Binding var workspaceElement: WorkspaceElement

    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 15))
                    .padding(.top, 30)
                    .padding(.trailing, 15)
            }
            TextEditor(text: $workspaceElement.content)
                .font(.system(size: 10).bold())
                .frame(height: 100)
                .padding(8)
                
        }
        .foregroundColor(Color("gray"))
        .background(Color("yellow"))
        .frame(width: 120, height: 120)
        .cornerRadius(20)
        .position(workspaceElement.position)
        .shadow(radius: 5)
        .gesture(
            DragGesture()
            .onChanged({ newValue in
                self.workspaceElement.position = newValue.location
            })
        )
    }
}

//struct PostIt_Previews: PreviewProvider {
//    static var previews: some View {
//        PostItView(workspaceElementModel: .init(position: CGPoint(x: 50, y: 50)))
//    }
//}
