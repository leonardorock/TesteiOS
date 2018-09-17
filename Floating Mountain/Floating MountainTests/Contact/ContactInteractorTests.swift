//
//  ContactInteractorTests.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Floating_Mountain
import XCTest

class ContactInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: ContactInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupContactInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupContactInteractor() {
        sut = ContactInteractor()
    }
    
    // MARK: Test doubles
    
    class ContactPresentationLogicSpy: ContactPresentationLogic {
        var presentFormCalled = false
        var presentContactSuccessCalled = false
        var changeVisibilityOfFieldCalled = false
        
        func presentForm(response: Contact.FetchForm.Response) {
            presentFormCalled = true
        }
        
        func presentContactSuccess() {
            presentContactSuccessCalled = true
        }
        
        func changeVisibilityOfField(with identifier: Int, to visibility: Bool) {
            changeVisibilityOfFieldCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testPresentForm() {
        // Given
        let spy = ContactPresentationLogicSpy()
        sut.presenter = spy
        let request = Contact.FetchForm.Request()
        
        // When
        sut.fetchForm(request: request)
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertTrue(spy.presentFormCalled, "fetchForm(request:) should ask the presenter to format the result")
        }
        
    }
    
    func testSendForm() {
        // Given
        let spy = ContactPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.sendForm()
        
        // Then
        XCTAssertTrue(spy.presentContactSuccessCalled, "sendForm() should ask the presenter to format the result")
    }
    
    func testChangeVisibility() {
        // Given
        let spy = ContactPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        sut.changeVisibilityOfField(with: 1, to: true)
        
        // Then
        XCTAssertTrue(spy.changeVisibilityOfFieldCalled, "changeVisibilityOfField(with:to:) should ask the presenter to format the result")
    }
    
}