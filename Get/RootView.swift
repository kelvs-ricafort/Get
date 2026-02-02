//
//  RootView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct RootView: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        if isAuthenticated {
            HomeView(isAuthenticated: $isAuthenticated)
        } else {
            NavigationStack {
                LoginView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    RootView(isAuthenticated: .constant(true))
}
