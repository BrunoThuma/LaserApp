//
//  NotesView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI



struct NotesView: View {
    @Binding var workspaceElement: WorkspaceElement
    var deleteItem: (UUID) -> Void
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy  HH:mm"
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
                        .foregroundColor(.black)
                        .menuStyle(BorderlessButtonMenuStyle(showsMenuIndicator: false))
                        .fixedSize()
                        .padding(.top, 28)
                        .padding(.trailing,12)
                    }
                }
                Spacer()
            }
        }
        .frame(width: 150, height: 180)
        .background(Color("white"))
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
