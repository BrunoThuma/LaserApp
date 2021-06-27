//
//  NotesView.swift
//  Laser
//
//  Created by Bruno Thuma on 22/06/21.
//

import SwiftUI



struct NotesView: View {
    @Binding var workspaceElement: WorkspaceElement
    
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy  HH:mm"
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 15))
                    .foregroundColor(Color("gray"))
                    .padding(.top, 50)
                    .padding(.trailing, 15)
            }
            Text(dateToString(date: workspaceElement.date))
                .foregroundColor(Color("black"))
                .font(.system(size: 10))
                .padding(.leading,12)
                .padding(.top, 2)
            
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
        .frame(width: 150, height: 180)
        .background(Color("white"))
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
