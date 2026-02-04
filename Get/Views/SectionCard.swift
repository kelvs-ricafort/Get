//
//  SectionCard.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

struct SectionCard: View {
    var title: String
    var isExpanded: Bool = false
    var onTap: (() -> Void)? = nil
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.down": "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(spacing: 16) {
        SectionCard(title: "Apple Park")
        
        SectionCard(
            title: "Explore",
            isExpanded: true
        )
        
        SectionCard(
            title: "My Reviews",
            onTap: {
                print("Tapped My Reviews")
            }
        )
    }
    .padding()
}
