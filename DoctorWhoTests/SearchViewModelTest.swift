//
//  SearchViewModelTest.swift
//  DoctorWhoTests
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import XCTest
@testable import DoctorWho

class SearchViewModelTest: XCTestCase {
    
    func test(){
        // given
        let viewModel = SearchViewModel()
        
        // when
        //already calling init
        
        // then
        viewModel.bindData = {
            XCTAssertEqual(viewModel.filtered.count > 0, true)
        }
                
        viewModel.bindError = {
            XCTFail("Received nil data")
        }
                
    }
    
    

}
