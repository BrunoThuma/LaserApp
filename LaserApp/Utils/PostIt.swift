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
                    if workspaceElement.showMenu {
                        Menu{
                        
                            
                            Menu {
                                Button(action: {
                                    
                                }) {
                                    Label("UX Design", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Design Editorial", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Design de Interfaces", systemImage: "globe")
                                }
                                Button(action: {
                                    
                                }) {
                                    Label("Leitura e Escrita Acadêmica", systemImage: "globe")
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
                            Image(systemName: "ellipsis")
                                .font(.system(size: 15))
                        }
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 10)
                        .padding(.trailing,12)
                    }
                }
                Spacer()
            }
                
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
                if !workspaceElement.fixed{
                    self.workspaceElement.position = newValue.location
                }
            })
        )
        .onHover { over in
            workspaceElement.showMenu = over
        }
    }
}

//struct PostIt_Previews: PreviewProvider {
//    static var previews: some View {
//        PostItView(workspaceElementModel: .init(position: CGPoint(x: 50, y: 50)))
//    }
//}
