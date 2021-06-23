//
//  VideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 22/06/21.
//

import SwiftUI

struct VideoView: View {
    @State private var videoUrl: String = ""
    @State private var position: CGPoint = CGPoint(x:400, y:400)
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .padding(.top,20)
                    .padding(.trailing,20)
            }
            
            Spacer()
            
            VStack{
                if videoUrl.contains("https://www.youtube.com/watch?v=") || videoUrl.contains("https://youtu.be/") {
                    EmbeddedVideoView(videoString: videoUrl)
                } else {
                    HStack{
                        Spacer()
                        
                        VStack{
                            Spacer()
                            VStack(alignment: .center){
                                Image(systemName: "play.rectangle.fill")
                                    .font(.system(size: 60))
                            }.padding(30)
                            
                            VStack(alignment:.center) {
                                HStack{
                                    Image(systemName: "link")
                                        .font(Font.body.weight(.heavy))
                                    TextField("Cole o link do vídeo aqui", text: $videoUrl)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .fixedSize()
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.10))
                            .cornerRadius(10)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
            }
            .background(Color.black)
            .frame(width: 480, height: 270)
            //.cornerRadius(20)
            .padding(.bottom, 20)
            .padding(.trailing, 20)
            .padding(.leading, 20)
        }
        .frame(width: 510, height: 320)
        .background(Color("pink"))
        .cornerRadius(20)
        .position(position)
        .gesture(
            DragGesture()
                .onChanged({ newValue in
                    self.position = newValue.location
                }))
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
