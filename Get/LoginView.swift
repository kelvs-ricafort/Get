//
//  LoginView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(true))
}
