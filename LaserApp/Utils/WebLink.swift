//
//  WebLink.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 29/06/21.
//

import SwiftUI

struct WebLinkView: View {
    @Binding var workspaceElement: WorkspaceElement
    var deleteItem: (UUID) -> Void
    var fixedSize: Bool = false
    
    func formatTitle(url: String) -> String {
        var title = url
        if title.count > 40 {
            title = String(title.prefix(40)) + "..."
        }
        return title
    }
    
    var body: some View {
        ZStack{
            HStack{
                Image(systemName: "link")
                    .font(Font.body.weight(.heavy))
                if workspaceElement.content == ""{
                    TextField("Paste your link here", text: $workspaceElement.content)
                        .textFieldStyle(PlainTextFieldStyle())
                        .fixedSize()
                } else {
                    Link(formatTitle(url: workspaceElement.content), destination: URL(string:workspaceElement.content)!)
                        .fixedSize()
                }
            }.padding(.trailing, 32)
            HStack{
                Spacer()
                if workspaceElement.showMenu {
                    Menu {
                   
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
                    .padding(.leading,17)
                }
            }
        }.fixedSize()
        .padding(17)
        .background(Color("gray"))
        .opacity(0.75)
        .cornerRadius(7)
        .position(self.workspaceElement.position)
        .shadow(radius: 5)
        .gesture(
            DragGesture()
                .onChanged({ newValue in
                    if !workspaceElement.fixed {
                        self.workspaceElement.position = newValue.location
                    }
                }))
        .onHover { _ in
            workspaceElement.showMenu.toggle()
        }
    }
}

//struct WebLink_Previews: PreviewProvider {
//    static var previews: some View {
//        WebLink()
//    }
//}
