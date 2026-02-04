//
//  ContributeView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct ContributeView: View {
    @State private var query = ""
    @State private var isEditing = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // MARK: - Search bar
                SearchBar(text: $query, isEditing: $isEditing) {
                    print("Searching: \(query)")
                }
                
                // MARK: - Explore
                SectionCard(title: "Explore") {
                    // Navigate or expand later
                    print("Explore tapped")
                }
                
                // MARK: - My Reviews
                SectionCard(title: "My Reviews") {
                    print("My Reviews Tapped")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Contribute")
        }
    }
}

#Preview {
    ContributeView()
}
