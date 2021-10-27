//
//  ProfileViewModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 27.10.2021.
//

import FirebaseFirestore


class ProfileViewModel {
    
    var doctor: Doctors!
    var bindData: (()->())?
    var bindError: (()->())?
    
    
    func getDoctor(id: String){
        Firestore.firestore().collection("profile").whereField("id", isEqualTo: id).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                self.bindError?()
                return
            }

            
            let doctors: [Doctors] = documents.map { (queryDocumentSnapshot) -> Doctors in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let subtitle = data["subtitle"] as? String ?? ""
                return Doctors(id: id,title: title, subtitle: subtitle)
            }
            
            if(!doctors.isEmpty){
                self.doctor = doctors.first
                self.bindData?()
            }
            
 
        }
    }
    

    

    
}
