//
//  ProfileViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var label: UILabel!
    var doctorId: String = ""
    var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        viewModel.getDoctor(id: doctorId)
        viewModel.bindData = {
            DispatchQueue.main.async { self.label.text =  "\(self.viewModel.doctor.name) \(self.viewModel.doctor.subtitle)"}
        }
        

    }
    
    
}
