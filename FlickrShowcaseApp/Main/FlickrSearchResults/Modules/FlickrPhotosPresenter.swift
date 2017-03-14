//
//  FlickrPhotosPresenter.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotosPresenterInput: FlickrPhotosInteractorOutput {
}

class FlickrPhotosPresenter: FlickrPhotosPresenterInput {
    
    weak var presenter: FlickrPhotosInteractorOutput!
    weak var view: FlickrPhotosViewControllerInput!
    var interactor: FlickrPhotosInteractorInput!
    var wireframe: FlickrPhotosWireframeInput!
    
    func getPhotos(for searchText: String, page: Int) {
        interactor.getPhotosFromDataManager(for: searchText, page: page)
    }
    
    func updatePhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        view.showPhotos(photos: photos, totalPagesCount: totalPagesCount, totalImagesCount: totalImagesCount)
    }
    
    func serviceError (error: String) {
        view.showError(errorMessage: defaultErrorMessage)
    }
    
    func goToFlickrPhotoDetailsVC() {
        wireframe.navigateToFlickrPhotoDetailsVC()
    }
    
    func sendDataToFlickrDetailsVC(segue: UIStoryboardSegue) {
        wireframe.sendDataToFlickrDetailsVC(segue: segue)
    }
    
    func prepareFlickrPhotosData(array: [FlickrPhotoModel], searchTag: String, totalPages: Int) {
        view.loadPreparedFlickrPhotosData(array: array, searchTag: searchTag, totalPages: totalPages)
    }
}
