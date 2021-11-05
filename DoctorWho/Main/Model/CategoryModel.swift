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
    
    init(name: String, image: String){
        self.name = name
        self.image = image
    }
}

