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
    var reloadTableView: (()->())?
    
    init(){
        getData()
    }
    
    
    func getData(){
        Database.database(url: Constants.DB).reference().child("category")
            .observeSingleEvent(of: .value, with: { snapshot in
                
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                        let item = Category(snapshot: snapshot) {
                        self.categories.append(item)
                        print(item)
                    }
                }
                self.reloadTableView?()
            })
    }
    
    
}
