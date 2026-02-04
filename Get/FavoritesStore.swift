//
//  FavoritesStore.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

@Observable
final class FavoritesStore {
    private let key = "favorites_places"
    var places: [FavoritePlace] = []
    
    init() {
        load()
    }
    
    func add(place: FavoritePlace) {
        guard !places.contains(place) else { return }
        places.append(place)
        save()
    }
    
    func remove(place: FavoritePlace) {
        places.removeAll { $0.id == place.id }
        save()
    }
    
    private func save(){
        guard let data = try? JSONEncoder().encode(places) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([FavoritePlace].self, from: data)
        else { return }
        
        places = decoded
            
    }
}
