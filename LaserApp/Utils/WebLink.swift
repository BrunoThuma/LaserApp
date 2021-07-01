//
//  WebLink.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 29/06/21.
//

import SwiftUI

struct WebLinkView: View {
    @Binding var workspaceElement: WorkspaceElement
    @State var showMenu = false
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
                    Menu {
                   
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
                    .padding(.leading,17)
            }
        }.onHover { _ in
            showMenu.toggle()
        }
        .fixedSize()
        .padding(17)
        .zIndex(workspaceElement.zIndex)
        .background(Color("gray"))
        .opacity(0.75)
        .cornerRadius(7)
        .position(self.workspaceElement.position)
        .shadow(radius: 5)
        
    }
}

//struct WebLink_Previews: PreviewProvider {
//    static var previews: some View {
//        WebLink()
//    }
//}
