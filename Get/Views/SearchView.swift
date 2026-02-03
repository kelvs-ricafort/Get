//
//  SearchView.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import SwiftUI

struct SearchView: View {
    @State private var query = ""
    @FocusState private var queryBoxFocused: Bool
    @State private var selectedCategory: SearchCategory? = nil
    @State private var selectedSubcategories: Set<String> = []
    @State private var isCategoryExpanded: Bool = false
    
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
            VStack(spacing: 0) {
                SearchBar(text: $query) {
                    performSearch()
                }
                .focused($queryBoxFocused)
                .padding(.top)
                
                // Categories
                HStack {
                    Button {
                        isCategoryExpanded.toggle()
                    } label: {
                        HStack {
                            Text(selectedCategory?.name ?? "Select Category")
                                .font(.headline)
                            Image(systemName: isCategoryExpanded ? "chevron.up": "chevron.down")
                                .font(.subheadline)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.gray.opacity(0.2))
                        .foregroundStyle(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                // Category options shown when expanded
                if isCategoryExpanded {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categoryOptions) { category in
                                Button(category.name) {
                                    selectedCategory = category
                                    selectedSubcategories.removeAll()
                                    isCategoryExpanded = false
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(selectedCategory?.id == category.id ? .blue.opacity(0.7) : .gray.opacity(0.2))
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // Subcategories
                if let category = selectedCategory {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(category.subcategories, id: \.self) { sub in
                                HStack(spacing: 6) {
                                    Spacer().frame(width: 6)
                                    Toggle(isOn: Binding(
                                        get: { selectedSubcategories.contains(sub) },
                                        set: { isOn in
                                            if isOn {
                                                selectedSubcategories.insert(sub)
                                            } else {
                                                selectedSubcategories.remove(sub)
                                            }
                                        }
                                    )) {
                                        Text(sub)
                                    }
                                    .toggleStyle(.switch)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 10)
                                    .background(selectedSubcategories.contains(sub) ? .green.opacity(0.7): .gray.opacity(0.2))
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 4)
                    }
                }
                // Filtered results
                List(filteredResults(), id: \.self) { item in
                    SectionCard(title: item)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func performSearch() {
        print("Search: ", query)
        print("Category:", selectedCategory?.name ?? "All")
        print("Subcategories:", Array(selectedSubcategories))
    }
    
    private func filteredResults() -> [String] {
        var filtered = items
        
        if !query.isEmpty {
            filtered = filtered.filter { $0.localizedCaseInsensitiveContains(query) }
        }
        
        if !selectedSubcategories.isEmpty {
            filtered = filtered.filter { item in
                selectedSubcategories.contains(where: { sub in
                    item.localizedCaseInsensitiveContains(sub)
                })
            }
        }
        
        return filtered
    }
}

#Preview {
    SearchView()
}
