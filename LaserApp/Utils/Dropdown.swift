//
//  Dropdown.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 21/06/21.
//

import SwiftUI

struct Dropdown: View {
    var options: [String]
    var placeholder: String
    @State var selected = ""
    
    let onSelectionChange: (String) -> Void
    
    var body: some View {
        Group {
            Menu {
                ForEach(options, id: \.self) { item in
                    Button(item, action: {
                        selected = item
                    })
                }
            } label: {
                Text(selected != "" ? selected : placeholder)
                    .foregroundColor(.gray)
                    .font(.system(size: 17))
            }
            .menuStyle(BorderlessButtonMenuStyle())
        }
        .frame(minWidth: 0, maxWidth: 238, minHeight: 0, maxHeight: 36, alignment: .leading)
        .padding(7)
        .background(Color.gray.opacity(0.12))
        .cornerRadius(10)
    }
}

//struct Dropdown_Previews: PreviewProvider {
//    static var previews: some View {
//        Dropdown(options: ["banana1", "banana2", "banana3",], placeholder: "Filters") { value in
//            print(value)
//        }
//    }
//}
