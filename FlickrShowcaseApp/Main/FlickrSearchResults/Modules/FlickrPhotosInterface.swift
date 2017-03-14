//
//  FlickrPhotosInterface.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation

class FlickrPhotosInterface {
    
    static let sharedInstance = FlickrPhotosInterface()
    
    func configure(viewController: FlickrPhotosViewController) {
        let dataManager = FlickrDataManager()
        let interactor = FlickrPhotosInteractor()
        let presenter = FlickrPhotosPresenter()
        let wireframe = FlickrPhotosWireframe()
        wireframe.viewController = viewController
        presenter.wireframe = wireframe
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        interactor.flickrAPIDataManager = dataManager
    }
}
