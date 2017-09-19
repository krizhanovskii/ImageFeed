//
//  ErrorParserHundler.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation

import Foundation
import SWSkelethon

final class ErrorParserHandler : ErrorParserProtocol {
    
    var statusCode: StatusCode
    var message: String
    
    required init(_ statusCode: StatusCode, message: String) {
        self.statusCode = statusCode
        self.message = message
    }
    
    static func parseError(_ JSON: AnyObject) -> ErrorParserHandler {
        // тут идет обработка респонсов от сервера
        return ErrorParserHandler(.badRequest, message: "bad request")
    }
}
