//
//  NotesView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI



struct NotesView: View {
    @Binding var workspaceElement: WorkspaceElement
    @State var showMenu: Bool = false
    var deleteItem: (UUID) -> Void
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy  HH:mm"
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Text(dateToString(date: workspaceElement.date))
                        .foregroundColor(Color("black"))
                        .font(.system(size: 10))
                        .padding(.leading,12)
                        .padding(.top, 30)
                    Spacer()
                }
                
                
                TextEditor(text: $workspaceElement.content)
                    .foregroundColor(Color("gray"))
                    .font(.system(size: 10))
                    .frame(height: 160)
                    .padding(.leading,8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)
                    .onChange(of: workspaceElement.content, perform: { content in
                        workspaceElement.date = Date()
                    
                    })
            }
            
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
        .zIndex(workspaceElement.zIndex)
        .background(Color("white"))
        .cornerRadius(20)
        .position(workspaceElement.position)
        .shadow(radius: 5)
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
