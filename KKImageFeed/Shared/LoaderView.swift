//
//  LoaderView.swift
//  Cosmia
//
//  Created by Krizhanovskii on 8/15/17.
//  Copyright © 2017 K.Krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon

class LoaderView: UIView, RegisterViewProtocol {
    static let shared = LoaderView()

    // MARK: - RegisterViewProtocol
    var view: UIView! {
        didSet {
            configure()
            configureStaticTexts()
            configureColors()
        }
    }
    
    func configure() {
        self.view.backgroundColor = UIColor.white
        self.view.layer.cornerRadius = 6
        self.view.addShadowWith(size: .zero, radius: 1)
        
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .white)
        activityIndicator.color = UIColor.black
        
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func configureColors() {
    }
    
    func configureStaticTexts() {
    }
    
    //MARK: - init
    convenience init () {
        var frame: CGRect = .zero
        frame.origin.x = UIScreen.main.bounds.width/2 - 50
        frame.origin.y = UIScreen.main.bounds.height/2 - 50
        frame.size.width = 100
        frame.size.height = 100
        self.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ({ view = xibSetuView() })()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ({ view = xibSetuView() })()
    }

    // MARK: - actions
    func show() {        
        if UIApplication.topViewController()?.navigationController != nil {
            self.alpha = 1
            UIApplication.topViewController()?.navigationController?.view.addSubview(self)
        } else {
            self.alpha = 1
            UIApplication.topViewController()?.view.addSubview(self)
        }
    }
    
    func close() {
        self.removeFromSuperview()
    }
}
