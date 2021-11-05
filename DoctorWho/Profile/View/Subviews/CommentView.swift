//
//  CommentView.swift
//  DoctorWho
//
//  Created by Okan Yaşar on 2.11.2021.
//

import Foundation
import UIKit


class CommentView: UIView {
    
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let commentLabel = UILabel()
    let ratingIcon = UIImageView(image: UIImage(named: "star-icon"))
    let ratingLabel = UILabel()
    let line = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(nameLabel)
        self.addSubview(dateLabel)
        self.addSubview(commentLabel)
        self.addSubview(ratingIcon)
        self.addSubview(ratingLabel)
        self.addSubview(line)
        
        commentLabel.numberOfLines = 0
        
        nameLabel.font = .boldSystemFont(ofSize: 17)
        dateLabel.textColor = .systemGray
        commentLabel.textColor = .systemGray
        ratingLabel.textColor = .systemGray
        line.backgroundColor = .systemGray
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingIcon.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            
            self.dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            self.ratingIcon.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            self.ratingIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.ratingIcon.widthAnchor.constraint(equalToConstant: 20),
            self.ratingIcon.heightAnchor.constraint(equalToConstant: 20),
            
            self.ratingLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            self.ratingLabel.leadingAnchor.constraint(equalTo: self.ratingIcon.trailingAnchor, constant: 8),
            
            self.commentLabel.topAnchor.constraint(equalTo: self.ratingIcon.bottomAnchor, constant: 16),
            self.commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.commentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.commentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            self.line.heightAnchor.constraint(equalToConstant: 0.5),
            self.line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.line.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.line.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWithData(_ data: Comment) {
        nameLabel.text = data.userName
        dateLabel.text = data.date
        commentLabel.text = data.comment
        ratingLabel.text = "\(data.rating)"
    }
    
}
