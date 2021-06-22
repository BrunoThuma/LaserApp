//
//  SearchBar.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 21/06/21.
//

import SwiftUI

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

struct SearchBar: View {
    let onTextChange: (String) -> Void
    
    @State private var searchText: String = ""
    @State private var focused: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 21))
            
            TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                if isEditing {
                    focused = true
                    return
                }
                
                focused = false
            })
                .onChange(of: searchText) { newValue in
                    onTextChange(newValue)
                }
                .textFieldStyle(.plain)
                .font(.system(size: 17))
        }
        .frame(minWidth: 0, maxWidth: 343, minHeight: 0, maxHeight: 36, alignment: .leading)
        .padding(7)
        .background(Color.gray.opacity(0.12))
        .cornerRadius(10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar { text in
            //            print(text)
        }
    }
}
