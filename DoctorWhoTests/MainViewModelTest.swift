//
//  MainViewModelTest.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import XCTest
@testable import DoctorWho

class MainViewModelTest: XCTestCase {
    
    func test(){
        // given
        let viewModel = MainViewModel()
        
        // when
        //already calling init
        
        // then
        viewModel.bindData = {
            XCTAssertEqual(viewModel.categories.count > 0, true)
        }
                
        viewModel.bindError = {
            XCTFail("Received nil data")
        }
                
    }
    


}
