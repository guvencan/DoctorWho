//
//  ProfileViewModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 27.10.2021.
//

import FirebaseFirestore


class ProfileViewModel {
    
    var doctor: Profile!
    var bindData: (()->())?
    var bindError: (()->())?
    
    
    func getDoctor(id: String){
        Firestore.firestore().collection("profile").whereField("id", isEqualTo: id).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                self.bindError?()
                return
            }

            
            let profiles: [Profile] = documents.map { (queryDocumentSnapshot) -> Profile in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let subtitle = data["subtitle"] as? String ?? ""
                let school = data["school"] as? String ?? ""
                return Profile(id: id, name: name, subtitle: subtitle, school: school)
            }
            
            if(!profiles.isEmpty){
                self.doctor = profiles.first
                self.bindData?()
            }
            
 
        }
    }
    

    

    
}
