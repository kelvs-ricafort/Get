//
//  MapView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var camera: MapCameraPosition = .automatic
    @State private var query = ""
    
    private let places: [Place] = [
        Place(name: "Apple Park", coordinate: .init(latitude: 37.3349, longitude: -122.0090)),
        Place(name: "Cupertino Library", coordinate: .init(latitude: 37.3229, longitude: -122.0322)),
        Place(name: "Coffee Shop", coordinate: .init(latitude: 37.3310, longitude: -122.0300)),
        Place(name: "Bowden", coordinate: .init(latitude: -34.9057889, longitude: 138.5779237))
    ]
    
    let location = CLLocationCoordinate2D(
        latitude: -34.9057889,
        longitude: 138.5779237
    )
    
    private var filteredPlaces: [Place] {
        query.isEmpty ? places : places.filter { $0.name.localizedCaseInsensitiveContains(query) }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $camera) {
                ForEach(filteredPlaces) { place in
                    Marker(place.name, coordinate: place.coordinate)
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    Button {
                        // Center on Location
                        camera = .region(MKCoordinateRegion(center: location, latitudinalMeters: 200, longitudinalMeters: 200))
                    } label: {
                        Text("Bowden SA")
                    }
                    Spacer()
                }
                .padding(.top)
                .background(.thinMaterial)
            }
            .mapStyle(.imagery)
            SearchBar(text: $query) {
                print("Searching for: ", query)
            }
        }
    }
}

#Preview {
    MapView()
}
