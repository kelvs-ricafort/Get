//
//  ProfileView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/2/26.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // MARK: - User Info
                HStack(spacing: 16) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.blue)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Johnny Appleseed")
                            .font(.title2)
                            .bold()
                        Text("johnny.appleseed@appleid.com")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: - Achievement Status
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Achievement Status")
                            .font(.headline)
                        Spacer()
                    }
                    VStack (alignment: .leading, spacing: 4) {
                        Text("Level: Intermediate")
                        Text("Points: 1200")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }
                .padding()
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // MARK: - Earned Badges
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Earned Badges")
                            .font(.headline)
                        Spacer()
                        HStack(spacing: 12) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Image(systemName: "bolt.fill")
                                .foregroundStyle(.orange)
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                            Spacer()
                        }
                        .font(.title3)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    // MARK: - My Reviews
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("My Reviews")
                                .font(.headline)
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Central Park - Wheelchair accessible")
                            Text("Local Café - Pet-friendly seating")
                            Text("City Mall - Needs better ramps")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                    
                    // MARK: - Logout Button
                    Button {
                        isAuthenticated = false
                    } label: {
                        Text("Logout")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                // MARK: - NavigationDestination for LoginView
                .navigationDestination(isPresented: Binding(
                    get: { !isAuthenticated},
                    set: { _ in }
                )) {
                        LoginView(isAuthenticated: $isAuthenticated)
                    }
            }
        }
    }
}

#Preview {
    ProfileView(isAuthenticated: .constant(true))
}
