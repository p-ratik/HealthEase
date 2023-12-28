//
//  HealthEaseTests.swift
//  HealthEaseTests
//
//  Created by Pratik Chougule on 04/08/23.
//

import XCTest
import FirebaseDatabaseSwift
@testable import HealthEase

final class HealthEaseTests: XCTestCase {
    
    var authModel = AuthViewModel()
    var text: String = "Pedi"
    let categories = [
        Category(id: "1", categoryName: "Pediatrician", image: "demoUrl1"),
        Category(id: "2", categoryName: "Cardiologist", image: "demoUrl2"),
        Category(id: "3", categoryName: "Neurosurgeon", image: "demoUrl3"),
        Category(id: "4", categoryName: "Psychiatrist", image: "demoUrl4")
    ]
    
    let doctors = [
    Doctor(id: "1", name: "Dr. Serena", speciality: "Primary Care", category: "Pediatrician", clinicName: "Good Life", image: "demourl", experience: "2 Years", patients: "2k+", rating: "3", about: "demoAbout", timeSlots: "12:30PM"),
    Doctor(id: "2", name: "Dr. Shalmon", speciality: " Pediatric Hematology Oncology", category: "Pediatrician", clinicName: "Morya", image: "demourl2", experience: "3 Years", patients: "2k+", rating: "4", about: "demoAbout", timeSlots: "12:30PM"),
    Doctor(id: "3", name: "Dr. Serena", speciality: "Primary Care", category: "Pediatrician", clinicName: "Good Life", image: "demourl", experience: "2 Years", patients: "2k+", rating: "5", about: "demoAbout", timeSlots: "12:30PM"),
    
    ]
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Email() throws {
        XCTAssertTrue(authModel.emailValidation("pratik@gmail.com"))
        XCTAssertFalse(authModel.emailValidation("pratik@gmail"))
        XCTAssertFalse(authModel.emailValidation("pratik@gmail.c"))
        XCTAssertFalse(authModel.emailValidation("pratik@gmail.12"))
    }
    
    func test_Password() throws {
        XCTAssertTrue(authModel.passwordValidation("1234@Test"))
        XCTAssertFalse(authModel.emailValidation("12345"))
        
    }
    
    func test_filtercategory() throws {
        XCTAssertGreaterThan(categories.filter{$0.categoryName.contains("Pedia")}.count, 0)
    }
    
    func test_filterdoctors() throws {
        XCTAssertGreaterThan(doctors.filter{$0.name.contains("Shal")}.count, 0)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
