//
//  SearchViewModel.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 27.10.2021.
//

import FirebaseFirestore

class SearchViewModel {
    
    private var doctors: [Doctors] = []
    var filtered: [Doctors] = []
    var bindData: (()->())?
    var bindError: (()->())?
    
    init(){
        getData()
    }
    
    
    func getData(){
        Firestore.firestore().collection("search").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                self.bindError?()
                return
            }

            self.filtered = documents.map { (queryDocumentSnapshot) -> Doctors in
                let data = queryDocumentSnapshot.data()                
                let id = data["id"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let subtitle = data["subtitle"] as? String ?? ""
                let tags = data["tags"] as? [String] ?? []
                return Doctors(id: id,title: title, subtitle: subtitle, tags: tags)
            }
            self.doctors = self.filtered
            self.bindData?()
        }
    }
    
    func filterData(searchText: String){
        
        let filterData = doctors.filter({ (doctor) -> Bool in
            doctor.title.starts(with: searchText) || doctor.subtitle.starts(with: searchText) || doctor.tags.contains(searchText)
        })

        self.filtered = filterData
        self.bindData?()
        
    }
    
    

    
}
