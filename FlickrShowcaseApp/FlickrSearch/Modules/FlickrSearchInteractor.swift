//
//  FlickrSearchInteractor.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation

protocol FlickrSearchInteractorInput: class {
    func getPhotosFromDataManager(for searchText: String, page: Int)
}

protocol FlickrSearchInteractorOutput: class {
    func updatePhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int)
    func serviceError (error: String)
}

class FlickrSearchInteractor: FlickrSearchInteractorInput {
    
    var flickrAPIDataManager: FlickrDataManager!
    weak var presenter: FlickrSearchInteractorOutput!
    
    func getPhotosFromDataManager(for searchText: String, page: Int) {
        flickrAPIDataManager.getPhotosFor(searchText: searchText, page: page, withSuccess: { (totalImagesForSearchTag, totalPagesForSearchTag, photos) in
            self.presenter.updatePhotos(photos: photos!, totalPagesCount: totalPagesForSearchTag, totalImagesCount: totalImagesForSearchTag)
        }) { (error) in
            let message = error.message
            self.presenter.serviceError(error: message)
        }
    }
}
