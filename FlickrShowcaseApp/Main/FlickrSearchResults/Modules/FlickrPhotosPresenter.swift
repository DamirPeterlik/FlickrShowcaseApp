//
//  FlickrPhotosPresenter.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotosPresenterInput: FlickrPhotosViewControllerOutput {
}

class FlickrPhotosPresenter: FlickrSearchPresenter {
    
    weak var presenter: FlickrSearchInteractorOutput!
    var wireframe: FlickrPhotosWireframeInput!
    
    override func getPhotos(for searchText: String, page: Int) {
        interactor.getPhotosFromDataManager(for: searchText, page: page)
    }
    
    override func updatePhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        view.showPhotos(photos: photos, totalPagesCount: totalPagesCount, totalImagesCount: totalImagesCount)
    }
    
    override func serviceError (error: String) {
        view.showError(errorMessage: defaultErrorMessage)
    }
    
    func goToFlickrPhotoDetailsVC() {
        wireframe.navigateToFlickrPhotoDetailsVC()
    }
    
    func sendDataToFlickrDetailsVC(segue: UIStoryboardSegue) {
        wireframe.sendDataToFlickrDetailsVC(segue: segue)
    }
    
}
