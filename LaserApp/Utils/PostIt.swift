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
    var deleteItem: (UUID) -> Void
    
    @State var showMenu = false

    var body: some View {
        ZStack {
            
            TextEditor(text: $workspaceElement.content)
                .font(.system(size: 10).bold())
                .frame(height: 100)
                .padding(.top, 15)
                .padding(8)
            
            VStack{
                HStack{
                    Spacer()
                        Menu{
                        
                            
                            Menu {
                                Button(action: {
                                    
                                }) {
                                    Label("UX Design", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Editorial Design", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Interface Design", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Academic Read and Write", systemImage: "globe")
                                }
                            }label : {
                                Label("Share", systemImage: "square.and.arrow.up")
                                
                            }.menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                            .fixedSize()
                            
                            Button(action: {
                                
                            }) {
                                Label("Add tag", systemImage: "tag")
                            }
                            
                            Button(action: {
                                self.workspaceElement.fixed = !self.workspaceElement.fixed
                            }) {
                                
                                if self.workspaceElement.fixed {
                                    Label("Unfix position", systemImage: "pin.slash")
                                }else {
                                    Label("Fix position", systemImage: "pin")
                                }
                            }
                            
                            Button(action: {
                                deleteItem(workspaceElement.id)
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                        } label: {
                            if showMenu {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 18))
                            }
                        }
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 10)
                        .padding(.trailing,12)
                }
                Spacer()
            }
                
        }
        .onHover { over in
            showMenu.toggle()
        }
        .foregroundColor(Color("gray"))
        .zIndex(workspaceElement.zIndex)
        .background(Color("yellow"))
        .frame(width: 120, height: 120)
        .cornerRadius(20)
        .position(workspaceElement.position)
        .shadow(radius: 5)
        
    }
}

//struct PostIt_Previews: PreviewProvider {
//    static var previews: some View {
//        PostItView(workspaceElementModel: .init(position: CGPoint(x: 50, y: 50)))
//    }
//}
