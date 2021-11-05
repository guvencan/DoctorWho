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
    var listener: ListenerRegistration?
    

    func makeSearch(searchText: String){
        listener = Firestore.firestore().collection("search").addSnapshotListener { (querySnapshot, error) in
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
            if(searchText != ""){
                self.filterData(query: searchText)
            }
            self.bindData?()

        }
    }
    
    func filterData(query: String){
        let filterData = doctors.filter({ (doctor) -> Bool in
            doctor.title.starts(with: query) || doctor.subtitle.starts(with: query) || doctor.tags.contains(query)
        })
        self.filtered = filterData
        
    }


    
}
