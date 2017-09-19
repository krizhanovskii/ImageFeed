//
//  ImageFeedDetailView.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon

class ImageFeedDetailView: UIView, RegisterViewProtocol {
    
    typealias DataType = ImageFeedViewModel
    
    // MARK: - outlets
    @IBOutlet fileprivate var imageViewContent: UIImageView!
    @IBOutlet fileprivate var lblInfo: UILabel!

    // MARK: - RegisterViewProtocol
    var view: UIView! {
        didSet {
            configure()
            configureStaticTexts()
            configureColors()
        }
    }
    
    func configure() {
        self.lblInfo.text = ""
    }
    
    func configureColors() {
    }
    
    func configureStaticTexts() {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ({ view = xibSetuView() })()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ({ view = xibSetuView() })()
    }

}

extension ImageFeedDetailView: DataProviderProtocol {
    func set(data: DataType) {
        self.lblInfo.text = data.info
        self.imageViewContent.setImage(data.imageBigUrl, placeHolder: UIImage())
    }
}
