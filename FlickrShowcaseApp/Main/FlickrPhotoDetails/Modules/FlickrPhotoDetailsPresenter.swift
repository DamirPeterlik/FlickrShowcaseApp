//
//  FlickrPhotoDetailsPresenter.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotoDetailsPresenterInput: FlickrPhotoDetailsInteractorOutput, FlickrPhotoDetailsOutput {
}

class FlickrPhotoDetailsPresenter: FlickrPhotoDetailsPresenterInput {
    
    var interactor: FlickrPhotoDetailsInteractorInput!
    weak var view: FlickrPhotoDetailsInput!
    
    func prepareSelectedFlickrPhotoModel(photoModel: FlickrPhotoModel) {
        interactor.configureFlickrPhotoModel(photoModel: photoModel)
    }
    
    func loadLargeFlickrPhotoModelImage() {
        interactor.loadImageFromUrl()
    }
    
    func sendPreparedPhotoImage(image: UIImage) {
        view.sendPreparedPhotoImage(image: image)
    }
}
