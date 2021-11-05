//
//  CommentViewTest.swift
//  DoctorWhoTests
//
//  Created by PCMACEGITIM on 4.11.2021.
//

import XCTest
@testable import DoctorWho

class CommentViewTest: XCTestCase {

 
    func testExample() throws {
        let commentView = CommentView()
        let comment : Comment
        comment = .init(comment: "deneme", userName: "Team3", date: "04/03/2010", rating: 2)
        commentView.initWithData(comment)
        
        
    }
}
