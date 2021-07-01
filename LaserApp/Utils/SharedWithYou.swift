//
//  SharedWithYou.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 26/06/21.
//

import SwiftUI

struct SharedWithYou: View {
    var importElement: (String) -> Void = {_ in ()}
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Shared with you")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 10)
                
                Group {
                    Text("@Ale Lacerda shared this postit")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.bottom, 8)
                    
                    HStack(alignment: .bottom) {
                        Image("postitSample")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .onTapGesture {
                                importElement("postitSample")
                            }
                        
                        VStack(alignment: .leading) {
                            Hashtag(data: HashtagData(title: "anotation", color: "pink"))
                            Hashtag(data: HashtagData(title: "summaries", color: "pink"))
                        }
                    }
                }
                
                Rectangle()
                    .frame(width: 170, height: 1)
                    .background(Color.white.opacity(0.01))
                    .padding(.vertical, 20)
                
                Group {
                    Text("@Gustavo Kuma shared this imagem")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.bottom, 8)
                    
                    HStack(alignment: .top) {
                        Image("imageSample")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .onTapGesture {
                                importElement("imageSample")
                            }
                        
                        VStack(alignment: .leading) {
                            Hashtag(data: HashtagData(title: "see", color: "turquoise"))
                            Hashtag(data: HashtagData(title: "infographic", color: "turquoise"))
                        }
                    }
                }
            }
            .padding(10)
        }
        .frame(width: 200, alignment: .topLeading)
        .background(Color("gray"))
        .cornerRadius(4.69)
    }
}

//struct SharedWithYou_Previews: PreviewProvider {
//    static var previews: some View {
//        SharedWithYou()
//    }
//}
