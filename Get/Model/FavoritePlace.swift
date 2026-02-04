//
//  FavoritePlace.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import Foundation

struct FavoritePlace: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    let name: String
    let address: String
}
