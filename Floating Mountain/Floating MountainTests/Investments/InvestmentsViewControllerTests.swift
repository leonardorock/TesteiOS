//
//  InvestmentsViewControllerTests.swift
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

class InvestmentsViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: InvestmentsViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupInvestmentsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupInvestmentsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "InvestmentsViewController") as? InvestmentsViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class InvestmentsBusinessLogicSpy: InvestmentsBusinessLogic {
        
        var fetchInvestmentsCalled = false
        var downloadMoreInfoCalled = false
        
        func fetch(request: Investments.FetchInvestments.Request) {
            fetchInvestmentsCalled = true
        }
        
        func downloadMoreInfo(request: Investments.DownloadMoreInfo.Request) {
            downloadMoreInfoCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = InvestmentsBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fetchInvestmentsCalled, "viewDidLoad() should ask the interactor to do something")
    }
    
    func testDisplayInvestments() {
        // Given
        let viewModel = Investments.FetchInvestments.ViewModel(
            title: "test",
            fundName: "test",
            whatIs: "test",
            definition: "test",
            riskTitle: "test",
            risk: 3,
            infoTitle: "test",
            moreInfo: Investments.FetchInvestments.ViewModel.MoreInfoViewModel(
                month: Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(fund: "test", cdi: "test"),
                year: Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(fund: "test", cdi: "test"),
                twelveMonths: Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(fund: "test", cdi: "test")),
            info: [Investments.FetchInvestments.ViewModel.InfoViewModel(name: "test", data: nil, showsDownloadButton: false)],
            downInfo: [Investments.FetchInvestments.ViewModel.InfoViewModel(name: "test", data: nil, showsDownloadButton: true)])
        
        // When
        loadView()
        sut.displayInvestments(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.fundTitleLabel.text, "test", "displayInvestments(viewModel:) should update the fundTitleLabel label")
        XCTAssertEqual(sut.fundNameLabel.text, "test", "displayInvestments(viewModel:) should update the fundNameLabel label")
        XCTAssertEqual(sut.whatIsLabel.text, "test", "displayInvestments(viewModel:) should update the whatIsLabel label")
        XCTAssertEqual(sut.definitionLabel.text, "test", "displayInvestments(viewModel:) should update the definitionLabel label")
        XCTAssertEqual(sut.riskTitleLabel.text, "test", "displayInvestments(viewModel:) should update the riskTitleLabel label")
        XCTAssertEqual(sut.riskBarView.currentRisk, 3, "displayInvestments(viewModel:) should update the riskBarView label")
        XCTAssertEqual(sut.infoTitleLabel.text, "test", "displayInvestments(viewModel:) should update the infoTitleLabel label")
        XCTAssertEqual(sut.monthFundLabel.text, "test", "displayInvestments(viewModel:) should update the monthFundLabel label")
        XCTAssertEqual(sut.monthCDILabel.text, "test", "displayInvestments(viewModel:) should update the monthCDILabel label")
        XCTAssertEqual(sut.yearFundLabel.text, "test", "displayInvestments(viewModel:) should update the yearFundLabel label")
        XCTAssertEqual(sut.yearCDILabel.text, "test", "displayInvestments(viewModel:) should update the yearCDILabel label")
        XCTAssertEqual(sut.twelveFundLabel.text, "test", "displayInvestments(viewModel:) should update the twelveFundLabel label")
        XCTAssertEqual(sut.twelveCDILabel.text, "test", "displayInvestments(viewModel:) should update the twelveCDILabel label")
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2, "displayInvestments(viewModel:) should update the tableView data")
    }
    
    func testDownloadMoreInfo() {
        // Given
        let spy = InvestmentsBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.downloadMoreInfo()
        // Then
        XCTAssertTrue(spy.downloadMoreInfoCalled, "downloadMoreInfo() should ask the interactor to download more info")
    }
}
