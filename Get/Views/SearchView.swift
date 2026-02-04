//
//  SearchView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

struct SearchView: View {
    @State private var query = ""
    @State private var isEditing = false
    
    @State private var selectedCategory: SearchCategory? = nil
    @State private var selectedSubcategories: Set<String> = []
    @State private var expandedCategory: SearchCategory? = nil
    
    private let items = [
        "Apple Park",
        "Cupertino Library",
        "Coffee Shop",
        "City Mall",
        "Public Park",
        "Accessible Restrooms",
        "Water bowls",
        "Eco Certifications"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                // MARK: - Search Bar
                SearchBar(
                    text: $query,
                    isEditing: $isEditing
                ) {
                    performSearch()
                }
                
                // MARK: - Categories (Horizontal, NOT scrollable)
                HStack(spacing: 12) {
                    ForEach(categoryOptions) { category in
                        Button {
                            expandedCategory = expandedCategory == category ? nil : category
                            selectedCategory = category
                            selectedSubcategories.removeAll()
                        } label: {
                            HStack(spacing: 4) {
                                Text(category.name)
                                    .font(.caption)
                                
                                Image(systemName: expandedCategory == category
                                      ? "chevron.up"
                                      : "chevron.down")
                                .font(.caption2)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                selectedCategory?.id == category.id
                                ? .blue.opacity(0.6)
                                : .gray.opacity(0.2)
                            )
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                .padding(.horizontal)
                
                // MARK: - Subcategories
                if let category = expandedCategory {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(category.subcategories, id: \.self) { sub in
                            HStack {
                                Text(sub)
                                    .font(.subheadline)
                                
                                Spacer()   // ✅ spacer before toggle
                                
                                Toggle(
                                    "",
                                    isOn: Binding(
                                        get: { selectedSubcategories.contains(sub) },
                                        set: { isOn in
                                            if isOn {
                                                selectedSubcategories.insert(sub)
                                            } else {
                                                selectedSubcategories.remove(sub)
                                            }
                                        }
                                    )
                                )
                                .labelsHidden()
                            }
                            Divider()
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                }
                
                // MARK: - Results
                List(filteredResults(), id: \.self) { item in
                    SectionCard(title: item)
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Search Logic
    private func performSearch() {
        print("Query:", query)
        print("Category:", selectedCategory?.name ?? "None")
        print("Subcategories:", selectedSubcategories)
    }
    
    private func filteredResults() -> [String] {
        var filtered = items
        
        if !query.isEmpty {
            filtered = filtered.filter {
                $0.localizedCaseInsensitiveContains(query)
            }
        }
        
        if !selectedSubcategories.isEmpty {
            filtered = filtered.filter { item in
                selectedSubcategories.contains {
                    item.localizedCaseInsensitiveContains($0)
                }
            }
        }
        
        return filtered
    }
}

#Preview {
    SearchView()
}
