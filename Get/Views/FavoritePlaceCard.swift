//
//  FavoritePlaceCard.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

struct FavoritePlaceCard: View {
    let place: FavoritePlace
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(place.name)
                    .font(.headline)
                
                Text(place.address)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button(role: .destructive) {
                onDelete()
            } label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
        }
        .padding()
        .background(.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FavoritePlaceCard(place: FavoritePlace(
            id: UUID(),
            name: "Central Park",
            address: "New York, NY"),
        onDelete: {print("Deleted") }
    )
    .padding()
}
