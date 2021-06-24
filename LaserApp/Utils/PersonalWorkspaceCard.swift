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
    let workspaceId: UUID
}

struct PersonalWorkspaceCard: View {
    var data: PersonalWorkspaceCardData
    
    let arrowButton: some View = Button(action: {
        print("click")
    }) {
        Image(systemName: "chevron.right.circle")
            .font(.system(size: 56.0))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.title)
                .font(.system(size: 20, weight: .bold))
            
            Spacer()
            
            HStack {
                HStack {
                    ForEach(data.hashtags) { hashtag in
                        Hashtag(data: hashtag)
                            .padding(.trailing, 7)
                    }
                    
                    Spacer()
                    
                    arrowButton
                }
            }
        }
    }
}

//struct PersonalWorkspaceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalWorkspaceCard()
//    }
//}
