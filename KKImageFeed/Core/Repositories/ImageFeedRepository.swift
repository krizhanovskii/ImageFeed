//
//  ImageFeedRepository.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import SWSkelethon
import RxSwift
import RxCocoa
import Alamofire

struct ImageFeedRepository {
    fileprivate static let disposeBag = DisposeBag()
    fileprivate static let apiClient = DefaultRestAPIClient()
    
    static func getImages(_ success:  @escaping (Array<ImageFeedModel>)->Void, failure: ResponseHandler?) {
        let request = ImageFeedRequest()
        apiClient.rx_execute(encoding: URLEncoding.default, request: request).subscribe(onNext: { items in
            RealmResolver.saveModelArrayToStorage(items.result, withUpdate: true)
            success(items.result)
        },
                                                                                        onError: { error in
                                          
                                                                                            RealmResolver.fetchAllItems(ImageFeedModel.self, success: { (items) in
                                                                                                if items.count > 0 {
                                                                                                    success(items)
                                                                                                } else {
                                                                                                    failure?(ErrorParserHandler.handleError(error))
                                                                                                }

                                                                                            }, failure: { (_) in
                                                                                                 failure?(ErrorParserHandler.handleError(error))
                                                                                            })
                                                                                            
                                                                                            
                                                                                            
                                                                                            
        })
            .addDisposableTo(disposeBag)
    }

}
