//
//  ImageFeedView.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon
import RxSwift
import RxCocoa

class ImageFeedView: UIView, RegisterViewProtocol {
    typealias DataType = [ImageFeedViewModel]
    
    // MARK: - outlets
    @IBOutlet fileprivate var collectionView: UICollectionView!

    fileprivate var disposeBag = DisposeBag()
    fileprivate let observable: Variable<DataType> = Variable<DataType>([])
    fileprivate let insetValue: CGFloat = 7
    
    let refreshControl = UIRefreshControl()

    // MARK: - RegisterViewProtocol
    var view: UIView! {
        didSet {
            configure()
            configureStaticTexts()
            configureColors()
            configureRX()
        }
    }
    
    func configure() {
        // there configure view
        self.collectionView.registerNib(ImageFeedCell.self)
        
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(self.resresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        collectionView.alwaysBounceVertical = true
        
    }
    
    func configureColors() {
        // there setup color of view elements
    }
    
    func configureStaticTexts() {
        // there static text that should be localized
    }
    
    func configureRX() {
        
        self.observable.asObservable().bindTo(collectionView
            .rx
            .items(cellIdentifier: ImageFeedCell.nibName, cellType: ImageFeedCell.self)) { row, data, cell in
                cell.set(data: data)
            }
            .addDisposableTo(disposeBag)
        
        self.collectionView.rx.modelSelected(ImageFeedViewModel.self).subscribe(onNext: { vm in
            let cntrl = ImageFeedDetailCntrl.initiateFromXIB()
            cntrl.set(data: vm)
            self.parentViewController?.show(cntrl, sender: nil)
        }).addDisposableTo(disposeBag)
    }
    
    func resresh() {
        (self.parentViewController as? UpdateProtocol)?.update()
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

extension ImageFeedView: DataProviderProtocol {
    func set(data: DataType) {
        self.observable.value = data
    }
}

extension ImageFeedView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insetValue
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return insetValue
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(self.view.frame.width - (insetValue * 3))/2
        let height: CGFloat = width
        
        return CGSize(width:width, height:height);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(insetValue, insetValue, insetValue, insetValue)
    }
}
