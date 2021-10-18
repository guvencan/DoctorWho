//
//  DoctorWhoTests.swift
//  DoctorWhoTests
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 18.10.2021.
//

import XCTest
@testable import DoctorWho

class DoctorWhoTests: XCTestCase {


    func testCategoryDataIsExist(){
        // given
        var data: categoryData?
        
        
        // when
        if let jsonData = readLocalFile(forName: "category") {
            do {
                data = try JSONDecoder().decode(categoryData.self, from: jsonData)
            } catch {
               
            }
        }
        
        
        // then
        if let categories = data?.category {
            XCTAssertEqual(categories.count > 0, true)
        } else {
            XCTFail("Received nil data")
        }
              

    }
    
    

}
