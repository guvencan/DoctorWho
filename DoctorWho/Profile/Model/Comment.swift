//
//  Comment.swift
//  DoctorWho
//
//  Created by Okan Yaşar on 2.11.2021.
//

import Foundation

struct Comment: Codable {
    let comment: String
    let userName: String
    let date: String
    let rating: Int
}
