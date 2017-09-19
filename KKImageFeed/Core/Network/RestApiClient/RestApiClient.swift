//
//  RestApiClient.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon

struct DefaultRestAPIClient: RestApiClienProtocol {
    typealias ResponseParser = ResponseParserHandler
    var baseUrl: String = Constants.serverUrl
}
