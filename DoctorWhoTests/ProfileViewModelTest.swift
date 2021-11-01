//
//  ProfileViewModelTest.swift
//  DoctorWhoTests
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import XCTest
@testable import DoctorWho

class ProfileViewModelTest: XCTestCase {
    
    func test(){
        // given
        let viewModel = ProfileViewModel()
        
        // when
        viewModel.getDoctor(id: "1")
        
        // then
        viewModel.bindData = {
            XCTAssertEqual(viewModel.doctor.name, "Cengiz Yılmaz")
        }
                
        viewModel.bindError = {
            XCTFail("Received nil data")
        }
                
    }

}
