//
//  MainViewModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 26.10.2021.
//

//
// https://github.com/DesarrolloAntonio/MVVM-Sample-for-iOS
//

import Firebase

class MainViewModel {
    
    
    var categories: [Category] = []
    var bindData: (()->())?
    var bindError: (()->())?
    
    init(){
        getData()
    }
    
    
    //Firestone example
    func getData(){
        Firestore.firestore().collection("category").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                self.bindError?()
                return
            }

            self.categories = documents.map { (queryDocumentSnapshot) -> Category in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                return Category(name: name, image: image)
            }
            self.bindData?()
        }
    }
    

}
