//
//  SearchCategory.swift
//  Get
//
//  Created by Kelvin Ricafort on 2/3/26.
//

import Foundation

struct SearchCategory: Identifiable {
    let id = UUID()
    let name: String
    let subcategories: [String]
}

let categoryOptions: [SearchCategory] = [
    SearchCategory(name: "Accessibility", subcategories: [
        "Wheelchair Access",
        "Ramps",
        "Elevators",
        "Accessible Parking",
        "Accessible Restrooms",
        "Braille Signage",
        "Hearing Loop"
    ]),
    SearchCategory(name: "Senior Friendly", subcategories: [
        "Senior Discount"
    ]),
    SearchCategory(name: "Pet-Friendly", subcategories: [
        "Outdoor Spaces",
        "Water bowls",
        "No Size Restrictions",
        "Pet Menu",
        "Leash Friendly Areas",
        "Indoor Pets Allowed"
    ]),
    SearchCategory(name: "Sustaibale", subcategories: [
        "Eco Certifications",
        "Renewable Energy",
        "Waste Reduction",
        "Local Sourcing",
        "Recycling Program",
        "Green Building"
    ])
]
