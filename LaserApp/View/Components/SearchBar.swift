//
//  SearchBar.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 21/06/21.
//

import SwiftUI

struct SearchBar: View {
  let onTextChange: (String) -> Void
  @State private var searchText: String = ""
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      
      TextField("Search", text: $searchText)
        .onChange(of: searchText) { newValue in
          onTextChange(newValue)
        }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 36, alignment: .leading)
    .padding(7)
    .cornerRadius(10)
  }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar { text in
            print(text)
        }
    }
}
