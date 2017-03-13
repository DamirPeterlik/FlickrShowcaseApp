//
//  FlickrPhotoDetailsInteractor.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotoDetailsInteractorOutput: class {
    func sendPreparedPhotoImage(image: UIImage)
}

protocol FlickrPhotoDetailsInteractorInput: class {
    func configureFlickrPhotoModel(photoModel: FlickrPhotoModel)
    func loadImageFromUrl()
}

class FlickrPhotoDetailsInteractor: FlickrPhotoDetailsInteractorInput {

    weak var presenter: FlickrPhotoDetailsInteractorOutput!
    var dataManager: FlickrDataManagerPhotoLoadProtocol!
    var flickrPhotoModel: FlickrPhotoModel?
    
    func configureFlickrPhotoModel(photoModel: FlickrPhotoModel) {
        self.flickrPhotoModel = photoModel
    }
    
    func loadImageFromUrl() {
        dataManager.getImageFromFlickrModel(url: (self.flickrPhotoModel?.largePhotoUrl)!, success: { (image, data) in
            if let image = image {
                self.presenter.sendPreparedPhotoImage(image: image)
            }
        }) { (error) in
            print(error.message)
        }
    }
}
