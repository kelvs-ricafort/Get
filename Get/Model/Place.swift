//
//  Place.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
