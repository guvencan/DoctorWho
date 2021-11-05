//
//  ProfileViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit
import FirebaseDatabase
import Kingfisher

class ProfileViewController: UIViewController{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var professionStackView: UIStackView!
    @IBOutlet weak var insuranceStackView: UIStackView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var schoolStackView: UIStackView!
    
    @IBOutlet weak var totalCommentCount: UILabel!
    @IBOutlet weak var totalRatingCount: UILabel!
    @IBOutlet weak var overallRating: UILabel!
    
    @IBOutlet weak var fiveStarProgress: UIProgressView!
    @IBOutlet weak var fiveStarPercentage: UILabel!
    @IBOutlet weak var fourStarPercentage: UILabel!
    @IBOutlet weak var threeStarPercentage: UILabel!
    @IBOutlet weak var twoStarPercentage: UILabel!
    @IBOutlet weak var oneStarPercentage: UILabel!
    @IBOutlet weak var fourStarProgress: UIProgressView!
    @IBOutlet weak var threeStarProgress: UIProgressView!
    @IBOutlet weak var twoStarProgress: UIProgressView!
    @IBOutlet weak var oneStarProgress: UIProgressView!
    
    var doctorId: String = ""
    var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profil"

        self.avatarView.layer.cornerRadius = 34
        self.button.setTitle("Randevu Al", for: .normal)

        viewModel.getDoctor(id: doctorId)
        viewModel.bindData = {
            DispatchQueue.main.async {
                self.nameLabel.text =  "\(self.viewModel.doctor.name)"
                
                self.hospitalLabel.text = self.viewModel.doctor.hospital
                
                self.avatarView.kf.setImage(with: URL(string: self.viewModel.doctor.photo))
                
                self.viewModel.doctor.profession.forEach { element in
                    let label = UILabel()
                    label.textColor = .systemGray
                    label.text = element
                    self.professionStackView.addArrangedSubview(label)
                }
                self.viewModel.doctor.insurance.forEach { element in
                    let label = UILabel()
                    label.textColor = .systemGray
                    label.text = element
                    self.insuranceStackView.addArrangedSubview(label)
                }
                
                let label = UILabel()
                label.textColor = .systemGray
                label.text = self.viewModel.doctor.school
                self.schoolStackView.addArrangedSubview(label) 
                

                self.fiveStarProgress.progress = self.viewModel.doctor.fiveStarProgress
                self.fourStarProgress.progress = self.viewModel.doctor.fourStarProgress
                self.threeStarProgress.progress = self.viewModel.doctor.threeStarProgress
                self.twoStarProgress.progress = self.viewModel.doctor.twoStarProgress
                self.oneStarProgress.progress = self.viewModel.doctor.oneStarProgress
                
                self.fiveStarPercentage.text = self.viewModel.doctor.fiveStarPercentage
                self.fourStarPercentage.text = self.viewModel.doctor.fourStarPercentage
                self.threeStarPercentage.text = self.viewModel.doctor.threeStarPercentage
                self.twoStarPercentage.text = self.viewModel.doctor.twoStarPercentage
                self.oneStarPercentage.text = self.viewModel.doctor.oneStarPercentage
                
                self.overallRating.text = self.viewModel.doctor.overall
                self.totalRatingCount.text = "\(self.viewModel.doctor.comments.count) puan"
                self.totalCommentCount.text = "ve \(self.viewModel.doctor.comments.count) yorum"
                
                self.contentView.translatesAutoresizingMaskIntoConstraints = false
                var lastView = self.ratingView
                self.viewModel.doctor.comments.forEach { comment in
                    let commentView = CommentView()
                    
                    commentView.initWithData(comment)
                    
                    self.contentView.addSubview(commentView)
                    
                    commentView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        commentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
                        commentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
                        commentView.topAnchor.constraint(equalTo: lastView!.bottomAnchor, constant: 16)
                    ])
                    
                    lastView = commentView
                }
                
                if let view = lastView as? CommentView {
                    view.line.isHidden = true
                }
                
                NSLayoutConstraint.activate([
                    lastView!.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
                    
                ])
            }
        }
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Randevu Al", message: "Randevu almak için telefonunuzun arama kısmına yönlendirileceksiniz. Devam etmek istiyor musunuz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { action in
            
            if let url = URL(string: "tel://\(self.viewModel.doctor.phone)") {
                UIApplication.shared.openURL(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: { action in
            
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
}
