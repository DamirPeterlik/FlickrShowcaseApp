//
//  FlickrPhotoDetailsInterface.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

class FlickrPhotoDetailsInterface {
    
    static let sharedInstance = FlickrPhotoDetailsInterface()
    
    func configure(_ viewController: FlickrPhotoDetailsViewController) {
        let dataManager: FlickrDataManagerPhotoLoadProtocol = FlickrDataManager()
        let interactor = FlickrPhotoDetailsInteractor()
        let presenter = FlickrPhotoDetailsPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        interactor.dataManager = dataManager
    }
}
