//
//  HomeView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isAuthenticated: Bool = true
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            FavoritesView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("Favorites")
                    }
                }
            ContributeView()
                .tabItem {
                    VStack {
                        Image(systemName: "plus")
                        Text("Contribute")
                    }
                }
            ProfileView(isAuthenticated: $isAuthenticated)
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
