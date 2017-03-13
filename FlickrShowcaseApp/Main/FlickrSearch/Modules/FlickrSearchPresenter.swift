//
//  FlickrSearchPresenter.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrSearchPresenterInput: FlickrSearchViewControllerOutput, FlickrSearchInteractorOutput {
}

class FlickrSearchPresenter: FlickrSearchPresenterInput {

    weak var view: FlickrSearchViewControllerInput!
    var interactor: FlickrSearchInteractorInput!
    
    func getPhotos(for searchText: String, page: Int) {
        interactor.getPhotosFromDataManager(for: searchText, page: page)
    }
    
    func updatePhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        view.showPhotos(photos: photos, totalPagesCount: totalPagesCount, totalImagesCount: totalImagesCount)
    }
    
    func serviceError (error: String) {
        view.showError(errorMessage: error)
    }
    
}
