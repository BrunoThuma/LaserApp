//
//  Image.swift
//  Laser
//
//  Created by Bruno Thuma on 29/06/21.
//

import SwiftUI

struct ImageView: View {
    @Binding var workspaceElement: WorkspaceElement
    @State var showMenu = false
    var deleteItem: (UUID) -> Void
    
    var body: some View {
        ZStack{
            Image(workspaceElement.content.isEmpty ? "sampleGuide" : workspaceElement.content)
                .resizable()
                .aspectRatio(contentMode: .fit)
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
                            if showMenu {
                                Image(systemName: "ellipsis")
                                    .font(.system(size: 15))
                            }

                        }
                        .foregroundColor(.black)
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 28)
                        .padding(.trailing,12)
                    
                }
                Spacer()
            }
        }
        .onHover { over in
            showMenu.toggle()
        }
        .frame(width: 150, height: 180)
        .cornerRadius(20)
        .position(self.workspaceElement.position)
        .shadow(radius: 5)
        .zIndex(workspaceElement.zIndex)
    }
}

//struct Image_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView()
//    }
//}
