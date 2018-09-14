//
//  InvestmentsInteractor.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol InvestmentsBusinessLogic {
    func fetch(request: Investments.FetchInvestments.Request)
}

protocol InvestmentsDataStore {
    //var name: String { get set }
}

class InvestmentsInteractor: InvestmentsBusinessLogic, InvestmentsDataStore {
    var presenter: InvestmentsPresentationLogic?
    var worker: InvestmentsWorker?
    
    func fetch(request: Investments.FetchInvestments.Request) {
        worker = InvestmentsWorker()
        worker?.fetch(request: request, completion: { (fund, error) in
            let response = Investments.FetchInvestments.Response(fund: fund, error: error)
            presenter?.presentFunds(response: response)
        })
    }
}