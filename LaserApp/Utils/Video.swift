//
//  VideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 22/06/21.
//

import SwiftUI

struct VideoView: View {
    @Binding var workspaceElement: WorkspaceElement
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(Color("gray"))
                    .font(.system(size: 15))
                    .padding(.top,20)
                    .padding(.trailing,15)
            }
            
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
                                    TextField("Cole o link do vídeo aqui",
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
            .padding(.bottom, 20)
            .padding(.trailing, 3)
            .padding(.leading, 3)
        }
        .frame(width: 325, height: 200)
        .background(Color("turquoise"))
        .cornerRadius(16)
        .position(self.workspaceElement.position)
        .shadow(radius: 5)
        .gesture(
            DragGesture()
                .onChanged({ newValue in
                    self.workspaceElement.position = newValue.location
                }))
    }
}

//struct VideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoView()
//    }
//}
