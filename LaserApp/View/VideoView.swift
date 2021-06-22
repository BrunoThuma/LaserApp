//
//  VideoView.swift
//  Laser
//
//  Created by Alessandra Fernandes Lacerda on 22/06/21.
//

import SwiftUI

struct VideoView: View {
    @State private var videoUrl: String = ""
    @State private var position: CGPoint = CGPoint(x:200, y:200)
    
    var body: some View {
        VStack{
        
            if videoUrl.contains("https://www.youtube.com/watch?v=") || videoUrl.contains("https://youtu.be/"){
                EmbeddedVideoView(videoString: videoUrl)
            } else {
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
            }
        }
        .frame(maxWidth: 480, maxHeight: 270)
        .background(Color.black.opacity(0.5))
        .cornerRadius(15)
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
