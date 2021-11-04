//
//  DoctorWhoUITests.swift
//  DoctorWhoUITests
//
//  Created by PCMACEGITIM on 4.11.2021.
//

import XCTest

class DoctorWhoUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    func testSearchButtonDefaultValue() throws {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.buttons["estetik"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Doktor, Hastane Ara"]/*[[".scrollViews.buttons[\"Doktor, Hastane Ara\"]",".buttons[\"Doktor, Hastane Ara\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.staticTexts["Deniz Karayün"].tap()
    }
    
    func testSearchButtonFirstElementSelection() throws {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.buttons["estetik"].tap()
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.staticTexts["Cengiz Yılmaz"].tap()
    }
    
    func testDefaultSearchButton() throws {
        
        
        let app = XCUIApplication()
        app.launch()
        app/*@START_MENU_TOKEN@*/.buttons["Doktor, Hastane Ara"]/*[[".scrollViews.buttons[\"Doktor, Hastane Ara\"]",".buttons[\"Doktor, Hastane Ara\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()
        
        
     
    }
    func testOpenDatePage() throws
    {
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()

        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.staticTexts["Retina Problemleri"].swipeUp()
        elementsQuery.staticTexts["Koç Üniversitesi Tıp Fakültesi"].swipeUp()
        
        let element = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Hakkımda").children(matching: .other).element(boundBy: 9)
        element.swipeUp()
        element.tap()
        element.swipeDown()
                
        
                
    }
    
    func testCancelTakeDate() throws{
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Randevu Al"]/*[[".buttons[\"Randevu Al\"].staticTexts[\"Randevu Al\"]",".staticTexts[\"Randevu Al\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Randevu Al"].scrollViews.otherElements.buttons["Vazgeç"].tap()
    }
    
    func testTakeDate() throws{
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Randevu Al"]/*[[".buttons[\"Randevu Al\"].staticTexts[\"Randevu Al\"]",".staticTexts[\"Randevu Al\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Randevu Al"].scrollViews.otherElements.buttons["Evet"].tap()
    }
    
    func testTerminateApp() throws {
        
   
       
        let app = XCUIApplication()
        app.launch()
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()
        app.terminate()
        app.activate()
    }
    
    func testReActiveApp() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Doktor, Hastane Ara"].staticTexts["Doktor, Hastane Ara"].tap()
        app.tables.cells.containing(.staticText, identifier:"Cengiz Yılmaz").staticTexts["Ortopedi ve Travmatoloji"].tap()
        app.activate()
        
        
    }
    
  
}
