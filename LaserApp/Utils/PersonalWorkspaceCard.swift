//
//  PersonalWorkspaceCard.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 23/06/21.
//

import SwiftUI

struct PersonalWorkspaceCardData: Identifiable {
    let id = UUID()
    let title: String
    let hashtags: [HashtagData]
//    let workspaceId: UUID // remove for production
}

struct PersonalWorkspaceCard: View {
    var data: PersonalWorkspaceCardData
    var onClick: () -> Void
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(data.title)
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    HStack {
                        ForEach(data.hashtags) { hashtag in
                            Hashtag(data: hashtag)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            onClick()
                        }) {
                            Image(systemName: "chevron.right.circle")
                                .font(.system(size: 18.57))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 24)
        }
        .frame(width: 335, height: 124, alignment: .top)
        .background(Color("gray"))
        .cornerRadius(10)
        .gesture(TapGesture().onEnded {
            onClick()
        })
    }
}

//struct PersonalWorkspaceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalWorkspaceCard()
//    }
//}
