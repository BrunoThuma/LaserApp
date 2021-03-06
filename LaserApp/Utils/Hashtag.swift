//
//  Hashtag.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 23/06/21.
//

import SwiftUI

struct HashtagData: Identifiable {
    let id = UUID()
    let title: String
    let color: String
}

struct Hashtag: View {
    var data: HashtagData
    
    var body: some View {
        Group {
            Text("#\(data.title)")
                .font(.system(size: 9, weight: .regular))
                .foregroundColor((data.color == "yellow" || data.color == "turquoise") ? Color("gray") : .white)
                .lineLimit(1)
        }
        .padding(5)
        .background(Color(data.color))
        .cornerRadius(14)
    }
}

//struct Hashtag_Previews: PreviewProvider {
//    static var previews: some View {
//        Hashtag()
//    }
//}
