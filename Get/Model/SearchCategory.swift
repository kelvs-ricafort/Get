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
    let subcategory: [String]
}

let categoryOptions: [SearchCategory] = [
    SearchCategory(name: "Accessibility", subcategory: [
        "Wheelchair Access",
        "Ramps",
        "Elevators",
        "Accessible Parking",
        "Accessible Restrooms",
        "Braille Signage",
        "Hearing Loop"
    ]),
    SearchCategory(name: "Senior Friendly", subcategory: [
        "Senior Discount"
    ]),
    SearchCategory(name: "Pet-Friendly", subcategory: [
        "Outdoor Spaces",
        "Water bowls",
        "No Size Restrictions",
        "Pet Menu",
        "Leash Friendly Areas",
        "Indoor Pets Allowed"
    ]),
    SearchCategory(name: "Sustaibale", subcategory: [
        "Eco Certifications",
        "Renewable Energy",
        "Waste Reduction",
        "Local Sourcing",
        "Recycling Program",
        "Green Building"
    ])
]
