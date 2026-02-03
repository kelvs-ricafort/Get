//
//  RegisterView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Inputs
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // MARK: - UI State
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var navigateToLogin = false
    
    // MARK: - App Auth State
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Name
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.words)
                // Email
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                // Password
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                // Confirm Password
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(.roundedBorder)
                
                // Error Message
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                // Register Button
                Button {
                    // Registration logic
                    register()
                } label: {
                    if isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Create Account")
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(isLoading)
                
                // Back to Login
                NavigationLink {
                    LoginView(isAuthenticated: $isAuthenticated)
                } label: {
                    Text("Already have an account? Login")
                        .font(.footnote)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Register")
            .navigationBarTitleDisplayMode(.inline)
            
            // Navigate to HomeView on success
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView(isAuthenticated: $isAuthenticated)
            }
        }
    }
    
    // MARK: - Register Logic
    private func register() {
        errorMessage = nil
        
        // Validation
        guard !name.isEmpty else {
            errorMessage = "Please enter your name."
            return
        }
        
        guard !email.isEmpty, email.contains("@") else {
            errorMessage = "Please enter a valid email."
            return
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters"
            return
        }
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        isLoading = true
        
        // Simulated Registration
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            isAuthenticated = true
            navigateToLogin = true
        }
    }
}

#Preview {
    RegisterView(isAuthenticated: .constant(false))
}
