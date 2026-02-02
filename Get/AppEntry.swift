//
//  AppEntry.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

@main
struct AppEntry: App {
    @State private var isAuthenticated = false
    
    var body: some Scene {
        WindowGroup {
            RootView(isAuthenticated: $isAuthenticated)
        }
    }
}
