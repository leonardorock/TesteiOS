//
//  ContactSuccessInteractor.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/16/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol ContactSuccessBusinessLogic {
    func sendAnotherMessage(request: ContactSuccess.SendAnotherMessage.Request)
}

protocol ContactSuccessDataStore {
}

class ContactSuccessInteractor: ContactSuccessBusinessLogic, ContactSuccessDataStore {
    var presenter: ContactSuccessPresentationLogic?
    var worker: ContactSuccessWorker?
    
    // MARK: Send another message
    
    func sendAnotherMessage(request: ContactSuccess.SendAnotherMessage.Request) {
        let response = ContactSuccess.SendAnotherMessage.Response()
        presenter?.presentSendAnotherMessage(response: response)
    }
}
