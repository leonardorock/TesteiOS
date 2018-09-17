//
//  ContactModels.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/14/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

enum Contact {
    
    enum FetchForm {
        struct Request {
        }
        struct Response {
            var form: Form?
            var error: Error?
        }
        struct ViewModel {
            
            let cells: [CellViewModel]
            
            struct CellViewModel {
                let id: Int
                let type: Form.Cell.FieldType
                let message: String?
                let typefield: Form.Cell.FieldType.TextFieldType?
                let hidden: Bool
                let topSpacing: Float
                let show: Int?
                let required: Bool
            }
            
        }
    }
    
    enum SendForm {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ChangeVisibilityOfField {
        struct Request {
            let identifier: Int?
            let visibility: Bool
        }
        struct Response {
            let identifier: Int
            let visibility: Bool
        }
        struct ViewModel {
            let identifier: Int
            let visible: Bool
        }
    }
    
}
