//
//  ImageViewExtension.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire
import Kingfisher

extension UIImageView {
    
    func setImage(_ url: String, placeHolder: UIImage? = nil, transparent: Bool = false, forceDownload: Bool = false, success: ((UIImage?)->Void)? = nil,  errorHundler:(()->Void)? = nil) {
        
        if placeHolder != nil {
            self.image = placeHolder
        }
        
        guard let encode = url.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            errorHundler?()
            return
        }
        
        guard let url = URL(string: encode) else {
            errorHundler?()
            return
        }
        var options: [KingfisherOptionsInfoItem] = []
        
        let processor = ResizingImageProcessor(referenceSize: self.frame.size * 2, mode: .aspectFill)
        options.append(.processor(processor))
        
        if forceDownload == true {
            options.append(.forceRefresh)
        }
        
        self.kf.setImage(with: url, placeholder: placeHolder, options: options) { (image, error, _, _) in
            if error != nil {
                errorHundler?()
                return
            }
            
            if transparent {
                self.image = image?.imageByMakingWhiteBackgroundTransparent()
            } else {
                self.image = image
            }
            success?(image)
        }
    }
    
    func stopDownload() {
        self.kf.cancelDownloadTask()
    }

}

extension UIImage {
    func imageByMakingWhiteBackgroundTransparent() -> UIImage? {
        if let rawImageRef = self.cgImage {
            let colorMasking: [CGFloat] = [200, 245, 200, 245, 200, 245]
            return UIImage(cgImage: rawImageRef.copy(maskingColorComponents: colorMasking)!)
        }
        return nil
    }
}

