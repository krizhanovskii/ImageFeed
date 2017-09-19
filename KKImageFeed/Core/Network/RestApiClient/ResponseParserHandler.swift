//
//  ResponseParserHandler.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon
import Alamofire

class ResponseParserHandler: ResponseParserProtocol {
    typealias ErrorParser = ErrorParserHandler
    static func parseResponse<T: APIRequestProtocol>(response: DataResponse<Any>,
                              request: T,
                              success: ((T.Response) -> Void)?,
                              failure: ResponseHandler?) {
        
        
        switch response.result {
        case .failure(let error):
            let err = error as NSError
            failure?(
                ErrorParser(
                    StatusCode(rawValue: err.code) ?? .badRequest,
                    message: err.localizedDescription
                )
            )
            return
        default:
            break
        }
        
        guard let JSON = response.result.value as AnyObject? else {
            return
        }
        
        if let statusCode = response.response?.statusCode , 200..<300 ~= statusCode {
            if let dict = JSON as? DictionaryAlias {
                success?(T.Response(JSON: dict))
            } else if let arrOfDict = JSON as? ArrayOfDictionaries {
                success?(T.Response(JSON: ["data":arrOfDict]))
            } else {
                success?(T.Response(JSON: [:]))
            }
            
        } else {
            failure?(ErrorParser.parseError(JSON))
        }
    }
    
}
