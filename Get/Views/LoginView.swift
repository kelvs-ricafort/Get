//
//  LoginView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct LoginView: View {
    // MARK: - App Auth State
    @Binding var isAuthenticated: Bool
    
    // MARK: - Inputs
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - UI State
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Email
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                // Password
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                // Error Message
                if let errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                // Login Button
                Button {
                    login()
                } label: {
                    if isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Login")
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .disabled(isLoading)
                
                // Register navigation
                NavigationLink {
                    RegisterView(isAuthenticated: $isAuthenticated)
                } label: {
                    Text("Don't have an account? Register")
                        .font(.footnote)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }
    
    private func login() {
        errorMessage = nil
        
        // Validation
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required"
            return
        }
        
        guard email.contains("@") else {
            errorMessage = "Please enter a valid email."
            return
        }
        
        isLoading = true
        
        // Simulated registration
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            
            if email.lowercased() == "kelvs.r@outlook.com" && password == "12345678" {
                isAuthenticated = true
                navigateToHome = true
            } else {
                errorMessage = "Invalid email or password."
            }
        }
    }
}

#Preview {
    LoginView(isAuthenticated: .constant(true))
}
