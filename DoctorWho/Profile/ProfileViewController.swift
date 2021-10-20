//
//  ProfileViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController{
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        
        let ref = Database.database(url: "https://doctorwho-bb2c7-default-rtdb.europe-west1.firebasedatabase.app").reference()
        ref.child("asd").setValue("ttttttt")
        
        ref.child("asd").observeSingleEvent(of: .value, with: { (snapshot) in
        if let tit = snapshot.value as? String {
        print("The value from the database: \(tit)")
            self.title = tit
        }
        })
    }
    
    
}
