//
//  ImageFeedCntrl.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import UIKit
import SWSkelethon

class ImageFeedCntrl: UIViewController {
    
    // MARK: - outlets
    @IBOutlet fileprivate var viewContent: ImageFeedView!
    
    /* View model */
    var viewModel: ImageFeedListViewModel? {
        didSet {
            guard let vm = self.viewModel else {
                return
            }
            vm.viewModelChanged = { Void in
                switch vm.requestStatus {
                case .loading:
                    Log.info.log("loading")
                    LoaderView.shared.show()
                    break
                case .error(let error):
                    Log.info.log("error")
                    self.viewContent.refreshControl.endRefreshing()
                    LoaderView.shared.close()
                    
                    self.showError(error.message)

                    break
                case .success:
                    Log.info.log("succes")
                    self.viewContent.set(data: vm.items)
                    self.viewContent.refreshControl.endRefreshing()
                    LoaderView.shared.close()
                    break
                }
            }
        }
    }

    // MARK: - lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ImageFeedListViewModel()
        self.update()
    }
    
    // this must be in extension or static class
    fileprivate func showError(_ message: String) {
        let alertCntrl = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertCntrl.addAction(okAction)
        self.present(alertCntrl, animated: true, completion: nil)
    }
}

extension ImageFeedCntrl: UpdateProtocol {
    func update() {
        self.viewModel?.update()
    }
}

extension ImageFeedCntrl: StoryboardProtocol {
    static var storyboardName: String {
        return "ImageFeedStoryboard"
    }
}
