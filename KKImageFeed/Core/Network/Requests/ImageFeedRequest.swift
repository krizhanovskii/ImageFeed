//
//  ImageFeedRequest.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation


import SWSkelethon
import Alamofire

class ImageFeedRequest: APIRequestProtocol {
    internal var parameters: [String: Any]? = nil
    internal var headers: [String: String] = [:]
    typealias Response = ImageFeedResponse
    
    required init(){}
    
    var HTTPMethod: HTTPMethod {return .get}
    
    var path: String {
        return "/api/?key=6484476-96aefb3f9e384175e16117e4d&q=kiev&per_page=50"
    }
}
