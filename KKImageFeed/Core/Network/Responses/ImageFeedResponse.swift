//
//  ImageFeedResponse.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon

struct ImageFeedResponse: APIResponseProtocol {
    typealias Model = ImageFeedModel
    var result : Array<Model> = Array<Model>()
    
    init (JSON: DictionaryAlias) {
        if let resp = JSON["hits"] as? ArrayOfDictionaries {
            self.result = Model.getList(resp)
        }
    }
}
