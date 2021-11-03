//
//  ProfileViewModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 27.10.2021.
//

import Firebase


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
                let photo = data["photo"] as? String ?? ""
                let phone = data["phone"] as? String ?? ""
                let hospital = data["hospital"] as? String ?? ""
                let subtitle = data["subtitle"] as? String ?? ""
                let school = data["school"] as? String ?? ""
                let profession = data["profession"] as? [String] ?? []
                let insurance = data["insurance"] as? [String] ?? []
                let tempComment = data["comments"] as? [NSDictionary] ?? []
                var totalRating = 0;
                
                var fiveStarCount = 0;
                var fourStarCount = 0;
                var threeStarCount = 0;
                var twoStarCount = 0;
                var oneStarCount = 0;
                
                
                
                var comments: [Comment] = []
                tempComment.forEach { element in
                    let commentName = element["userName"] as? String ?? ""
                    let commentText = element["comment"] as? String ?? ""
                    let commentDate = element["date"] as? String ?? ""
                    let commentRating = element["rating"] as? Int ?? 0
                    totalRating += commentRating
                    
                    if(commentRating == 5){
                        fiveStarCount += 1;
                    }
                    else if(commentRating == 4){
                        fourStarCount += 1;
                    }
                    else if(commentRating == 3){
                        threeStarCount += 1;
                    }
                    else if(commentRating == 2){
                        twoStarCount += 1;
                    }
                    else if(commentRating == 1){
                        oneStarCount += 1;
                    }
                    else{

                    }
                    comments.append(Comment(comment: commentText, userName: commentName, date: commentDate, rating: commentRating))
                }
                var result: Double = Double(totalRating) / Double(tempComment.count)
                let average: String = String(format: "%.1f", result)
                
                var result1: Float = Float(oneStarCount) / Float(tempComment.count)
                var result2: Float = Float(twoStarCount) / Float(tempComment.count)
                var result3: Float = Float(threeStarCount) / Float(tempComment.count)
                var result4: Float = Float(fourStarCount) / Float(tempComment.count)
                var result5: Float = Float(fiveStarCount) / Float(tempComment.count)
                
                let fiveStarPercentage: String = String(format: "%.0f", result5 * 100) + "%"
                let fourStarPercentage: String = String(format: "%.0f", result4 * 100) + "%"
                let threeStarPercentage: String = String(format: "%.0f", result3 * 100) + "%"
                let twoStarPercentage: String = String(format: "%.0f", result2 * 100) + "%"
                let oneStarPercentage: String = String(format: "%.0f", result1 * 100) + "%"
                
                return Profile(id: id, name: name, photo: photo, phone: phone, hospital: hospital, subtitle: subtitle, school: school, profession: profession, insurance: insurance, overall: average, comments: comments,
                               fiveStarProgress: result5, fourStarProgress: result4, threeStarProgress: result3, twoStarProgress: result2, oneStarProgress: result1, fiveStarPercentage: fiveStarPercentage, fourStarPercentage: fourStarPercentage, threeStarPercentage: threeStarPercentage, twoStarPercentage: twoStarPercentage, oneStarPercentage: oneStarPercentage)
            }
            
            if(!profiles.isEmpty){
                self.doctor = profiles.first
                self.bindData?()
            }
            
 
        }
    }
    

    

    
}
