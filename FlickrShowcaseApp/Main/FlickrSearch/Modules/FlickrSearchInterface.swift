//
//  FlickrSearchInterface.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation

class FlickrSearchInterface {
    
    static let sharedInstance = FlickrSearchInterface()
    
    func configure(viewController: FlickrSearchViewController) {
        let dataManager = FlickrDataManager()
        let interactor = FlickrSearchInteractor()
        let presenter = FlickrSearchPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        interactor.flickrAPIDataManager = dataManager
    }
}
