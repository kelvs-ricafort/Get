//
//  HomeView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isAuthenticated: Bool = true
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            
            // Settings button on the upper right
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            NavigationStack {
                SettingsView()
            }
        }
    }
}

#Preview {
    HomeView()
}
