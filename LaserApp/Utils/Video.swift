//
//  VideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 22/06/21.
//

import SwiftUI

struct VideoView: View {
    @Binding var workspaceElement: WorkspaceElement
    var deleteItem: (UUID) -> Void
    
    @State var showMenu = false
    
    var body: some View {
        ZStack{
            
            VStack {
                Spacer()
                VStack{
                    if self.workspaceElement.content.contains("https://www.youtube.com/watch?v=") || self.workspaceElement.content.contains("https://youtu.be/") {
                        EmbeddedVideoView(videoString: self.workspaceElement.content)
                    } else {
                        HStack{
                            Spacer()
                            
                            ZStack{
                                VStack(alignment: .center){
                                    Image(systemName: "play.rectangle.fill")
                                        .font(.system(size: 30))
                                }.padding()
                                
                                VStack(alignment:.center) {
                                    Spacer()
                                    HStack{
                                        Image(systemName: "link")
                                            .font(Font.body.weight(.heavy))
                                        TextField("Paste your link here",
                                                  text: $workspaceElement.content)
                                            .textFieldStyle(PlainTextFieldStyle())
                                            .fixedSize()
                                    }
                                    .padding(8)
                                    .background(Color.gray.opacity(0.10))
                                    .cornerRadius(10)
                                }
                                .padding()
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                }
                .background(Color.black)
                .frame(width: 320, height: 180)
                .cornerRadius(12)
                .padding(.bottom, 3)
                .padding(.trailing, 3)
                .padding(.leading, 3)
            }
            
            VStack{
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
                                    .font(.system(size: 18))
                            }
                        }
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 3)
                        .padding(.trailing,5)
                }
                Spacer()
            }
            
        
        }
        .onHover { over in
            showMenu.toggle()
        }
        .frame(width: 325, height: 200)
        .background(Color("turquoise"))
        .cornerRadius(16)
        .position(self.workspaceElement.position)
        .shadow(radius: 5)
        .zIndex(workspaceElement.zIndex)
    }
}

//struct VideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoView()
//    }
//}
