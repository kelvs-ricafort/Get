//
//  RootView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            HomeView()
        } else {
            NavigationStack {
                LoginView(isAuthenticated: .constant(false))
            }
        }
    }
}

#Preview {
    RootView()
}
