//
//  ImageFeedListViewModel.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon

class ImageFeedListViewModel: ViewModelProtocol {
    
    var items: [ImageFeedViewModel] {
        return self.model.map({ImageFeedViewModel($0)})
    }
    
    
    /// ModelType
    typealias ModelType = ImageFeedModel
    /// Array or Single object. Example: typealias Model = Array<ModelType> or typealias Model = ModelType
    typealias Model = Array<ModelType>
    /// Status for current request
    var requestStatus: RequestStatus = {
        return .success
        }() {
        didSet {
            self.viewModelChanged?()
        }
    }
    /// Function for force view model update
    var viewModelChanged: (() -> Void)?
    /// Your model variable
    
    var model: Model
    
    /// init functions
    required init() {
        self.model = Model()
    }
    required init(_ model: Model) {
        self.model = model
    }
    
    /// Set new Model type
    func set(_ model: Model) {
        self.model = model
    }
    
    func update() {
        self.requestStatus = .loading
        
        ImageFeedRepository.getImages({ (images) in
            self.set(images)
            self.requestStatus = .success
        }, failure: {self.requestStatus = .error($0)})
    }
}

class ImageFeedViewModel: ViewModelProtocol {
    
    var id: Int {
        return model.id
    }
    
    var imageUrl: String {
        return model.imageUrl
    }
    
    var imageBigUrl: String {
        return model.imageBigUrl
    }
    
    var info: String {
        return "Photo with \(model.tags) by \(model.author)"
    }
    
    var likes: Int {
        return model.likes
    }
    
    /// ModelType
    typealias ModelType = ImageFeedModel
    /// Array or Single object. Example: typealias Model = Array<ModelType> or typealias Model = ModelType
    typealias Model = ModelType
    /// Status for current request
    var requestStatus: RequestStatus = {
        return .success
        }() {
        didSet {
            self.viewModelChanged?()
        }
    }
    /// Function for force view model update
    var viewModelChanged: (() -> Void)?
    /// Your model variable
    
    var model: Model
    
    /// init functions
    required init() {
        self.model = Model()
    }
    required init(_ model: Model) {
        self.model = model
    }
    
    /// Set new Model type
    func set(_ model: Model) {
        self.model = model
    }
}
