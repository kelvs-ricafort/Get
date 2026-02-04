//
//  SettingsView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/4/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("App Info")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")
                }
                HStack {
                    Text("Build")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown")
                        .foregroundStyle(.secondary)
                }
            }
            
            Section(header: Text("Developer")) {
                Text("Kelvin Ricafort")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
