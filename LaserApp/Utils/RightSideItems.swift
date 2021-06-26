//
//  RightSideItems.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 25/06/21.
//

import SwiftUI

let hashtagsSampleData = [
    HashtagData(title: "video", color: "yellow"),
    HashtagData(title: "escute", color: "purple"),
    HashtagData(title: "videoaula", color: "yellow"),
    HashtagData(title: "pratique", color: "deepPurple"),
    HashtagData(title: "audio", color: "yellow"),
    HashtagData(title: "podcast", color: "purple"),
    HashtagData(title: "leia", color: "turquoise"),
]

let sectionsSampleData = [
    PersonalGoalsSectionData(title: "Entregas Sustentabilidade", items: [
        PersonalGoalsSectionItemData(name: "Relatório"),
        PersonalGoalsSectionItemData(name: "Entrevistas"),
        PersonalGoalsSectionItemData(name: "Entrega mapa mental"),
    ]),
    PersonalGoalsSectionData(title: "TDE 02 / UX", items: [
        PersonalGoalsSectionItemData(name: "Analise"),
        PersonalGoalsSectionItemData(name: "Relatório"),
    ]),
    PersonalGoalsSectionData(title: "30 min meditação", items: [
        PersonalGoalsSectionItemData(name: "Segunda"),
        PersonalGoalsSectionItemData(name: "Terça"),
        PersonalGoalsSectionItemData(name: "Quarta"),
        PersonalGoalsSectionItemData(name: "Quinta"),
        PersonalGoalsSectionItemData(name: "Sexta"),
    ]),
]

enum RightSideItemsType {
    case home
    case workspace
}

struct RightSideItems: View {
    var type: RightSideItemsType = .home
    
    var importElement: (String) -> Void = {_ in ()}
    
    struct ProfileAndNotifications: View {
        var body: some View {
            ZStack(alignment: .topTrailing) {
                HStack(alignment: .center) {
                    Image(systemName: "bell.badge.fill")
                        .font(.system(size: 16.07, weight: .regular))
                        .padding(.trailing, 10)
                    
                    Image("sampleUser")
                        .resizable()
                        .frame(width: 46.0, height: 46.0)
                }
                
                Image("sampleGuide")
                    .resizable()
                    .frame(width: 132, height: 165)
                    .offset(x: -65, y: 15)
            }
            .frame(width: 200, height: 190)
        }
    }
    
    struct YourHashtags: View {
        struct HashtagLine: Identifiable {
            let id = UUID()
            var hashtags: [HashtagData]
        }
        
        var hashtags: [HashtagData] = []
        var hashtagsLines: [HashtagLine] = []
        
        init(hashtags: [HashtagData]) {
            self.hashtags = hashtags
            
            var counter = 0
            var aux = HashtagLine(hashtags: [])
            
            for i in 0..<hashtags.count {
                if counter % 3 == 0 && counter != 0 {
                    hashtagsLines.append(aux)
                    aux.hashtags = []
                    counter = 0
                }
                
                aux.hashtags.append(hashtags[i])
                counter += 1
            }
            
            if aux.hashtags.count != 0 {
                hashtagsLines.append(aux)
            }
        }
        
        var body: some View {
            Group {
                VStack(alignment: .leading) {
                    Text("Suas Hashtags")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 10)
                    
                    ForEach(0..<hashtagsLines.count) { i in
                        HStack(alignment: .center) {
                            ForEach(hashtagsLines[i].hashtags) { item in
                                Hashtag(data: item)
                            }
                        }
                    }
                }
                .padding(10)
            }
            .frame(width: 200, alignment: .topLeading)
            .background(Color("gray"))
            .cornerRadius(10)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ProfileAndNotifications()
                .padding(.bottom, 15)
            
            YourHashtags(hashtags: hashtagsSampleData)
                .padding(.bottom, 18)
            
            switch(type) {
            case .home:
                PersonalGoals(sectionsData: sectionsSampleData)
            case .workspace:
                SharedWithYou(importElement: importElement)
            }
        }
        .frame(width: 200, alignment: .topLeading)
    }
}

//struct RightSideItems_Previews: PreviewProvider {
//    static var previews: some View {
//        RightSideItems()
//    }
//}
