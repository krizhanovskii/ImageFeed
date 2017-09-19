//
//  ImageFeedCell.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon

class ImageFeedCell: UICollectionViewCell, RegisterCellProtocol, DataProviderProtocol {
    
    typealias DataType = ImageFeedViewModel
    
    // MARK: - outlets
    @IBOutlet fileprivate var imageViewBackground: UIImageView!
    @IBOutlet fileprivate var viewOpague: UIView!
    @IBOutlet fileprivate var lblLikes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewBackground.image = UIImage()
    }
    
    func set(data: DataType) {
        self.imageViewBackground.setImage(data.imageUrl, placeHolder: UIImage())
        self.lblLikes.text = "Likes: \(data.likes)"
    }
}
