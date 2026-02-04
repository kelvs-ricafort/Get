//
//  FavoritesView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var store = FavoritesStore()
    
    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Favorites")
        }
        .onAppear {
            // Load sample data for preview/testing
            if store.places.isEmpty {
                store.places = sampleFavorites
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if store.places.isEmpty {
            emptyState
        } else {
            favoritesList
        }
    }
    
    // MARK: - List
    private var favoritesList: some View {
        List {
            ForEach(store.places) { place in
                FavoritePlaceCard(place: place) {
                    store.remove(place: place)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
    
    // MARK: - Empty State
    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.slash")
                .font(.system(size: 44))
                .foregroundStyle(.gray)
            
            Text("No Favorites Yet")
                .font(.title3)
                .fontWeight(.semibold)
            
            Text("Save locations to access them offline")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
    
    // MARK: - Sample Data
    private var sampleFavorites: [FavoritePlace] = [
        FavoritePlace(id: UUID(), name: "Central Park", address: "New York, NY"),
        FavoritePlace(id: UUID(), name: "Golden Gate Bridge", address: "San Francisco, CA"),
        FavoritePlace(id: UUID(), name: "Eiffel Tower", address: "Paris, France")
    ]
}

#Preview {
    FavoritesView()
}
