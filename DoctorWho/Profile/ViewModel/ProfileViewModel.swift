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
                let profession = data["profession"] as? [String] ?? []
                let insurance = data["insurance"] as? [String] ?? []
                let tempComment = data["comments"] as? [NSDictionary] ?? []
                var comments: [Comment] = []
                tempComment.forEach { element in
                    let commentName = element["userName"] as? String ?? ""
                    let commentText = element["comment"] as? String ?? ""
                    let commentDate = element["date"] as? String ?? ""
                    let commentRating = element["rating"] as? Int ?? 0
                    
                    comments.append(Comment(comment: commentText, userName: commentName, date: commentDate, rating: commentRating))
                }
                
                return Profile(id: id, name: name, subtitle: subtitle, school: school, profession: profession, insurance: insurance, comments: comments)
            }
            
            if(!profiles.isEmpty){
                self.doctor = profiles.first
                self.bindData?()
            }
            
 
        }
    }
    

    

    
}
