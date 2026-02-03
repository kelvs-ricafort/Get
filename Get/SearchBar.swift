//
//  SearchBar.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    @FocusState var queryBoxFocused: Bool
    @State var showOptions = false

    
    @State private var isEditing = false
    
    var body: some View {
        HStack(spacing: 8) {
            TextField("Search For places, or categories", text: $text)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .submitLabel(.search)
                .focused($queryBoxFocused)
                .onSubmit {
                    onSearch()
                }
            if queryBoxFocused && !text.isEmpty {
                Button {
                    onSearch()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(text: .constant("Wheelchair Access")) {
        print("Search Tapped")
    }
    .padding()
}
