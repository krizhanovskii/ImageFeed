//
//  ImageFeedDetailCntrl.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon

class ImageFeedDetailCntrl: UIViewController, XibProtocol {

    typealias DataType = ImageFeedViewModel
    
    var data: DataType = DataType()
    
    // MARK: - outlets
    @IBOutlet fileprivate var viewContent: ImageFeedDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewContent.set(data: data)
    }

}

extension ImageFeedDetailCntrl: DataProviderProtocol {
    func set(data: DataType) {
        self.data = data
    }
}
