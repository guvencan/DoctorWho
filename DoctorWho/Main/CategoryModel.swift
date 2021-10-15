//
//  CategoryModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 15.10.2021.
//

import Foundation

struct category: Codable {
    let name: String
    let image: String
}

struct categoryData: Codable {
    let category: [category]
}
