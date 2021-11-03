//
//  Profile.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation

struct Profile: Codable {
    let id: String
    let name: String
    let photo: String
    let phone: String
    let hospital: String
    let subtitle: String
    let school: String
    let profession: [String]
    let insurance: [String]
    let comments: [Comment]
}
