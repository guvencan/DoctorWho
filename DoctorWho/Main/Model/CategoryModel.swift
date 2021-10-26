//
//  CategoryModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 15.10.2021.
//

import Firebase

struct Category: Codable {
    let name: String
    let image: String
    
    init?(snapshot: DataSnapshot) {
      guard
        let value = snapshot.value as? [String: AnyObject],
        let name = value["name"] as? String,
        let image = value["image"] as? String
      else {
        return nil
      }

      self.name = name
      self.image = image
    }
}

struct categoryData: Codable {
    let category: [Category]
}
