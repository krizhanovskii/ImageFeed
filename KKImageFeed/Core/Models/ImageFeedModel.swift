//
//  FeedImageModel.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon
import RealmSwift

class ImageFeedModel: Object, ModelProtocol, Listable {
    
    dynamic var id: Int = intDummy
    dynamic var imageUrl: String = stringDummy
    dynamic var imageBigUrl: String = stringDummy
    dynamic var tags: String = stringDummy
    dynamic var likes: Int = intDummy
    dynamic var author: String = stringDummy
    
    override static func primaryKey() -> String? {
        return "id"
    }

    convenience required init(resp: DictionaryAlias) {
        self.init()
        
        self.id = resp["id"] as? Int ?? intDummy
        self.imageUrl = resp["previewURL"] as? String ?? stringDummy
        self.imageBigUrl = resp["webformatURL"] as? String ?? stringDummy
        self.tags = resp["tags"] as? String ?? stringDummy
        self.likes = resp["likes"] as? Int ?? intDummy
        self.author = resp["user"] as? String ?? stringDummy
    }
}
