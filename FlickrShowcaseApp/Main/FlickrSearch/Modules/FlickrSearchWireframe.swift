//
//  FlickrSearchWireframe.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrSearchWireframeInput: class {
    func navigateToFlickrPhotosVC()
    func sendDataToFlickrPhotosVC(segue: UIStoryboardSegue)
}

class FlickrSearchWireframe: FlickrSearchWireframeInput {
    
    weak var viewController: FlickrSearchViewController!
    
    func navigateToFlickrPhotosVC() {
        viewController.performSegue(withIdentifier: flickrPhotosVCsegue, sender: nil)
    }
    
    func sendDataToFlickrPhotosVC(segue: UIStoryboardSegue) {
        if segue.identifier == flickrPhotosVCsegue {
            prepareDataToBeSent(segue: segue)
        }
    }
    
    func prepareDataToBeSent(segue: UIStoryboardSegue) {
        let photoVC = segue.destination as! FlickrPhotosViewController
        photoVC.presenter.prepareFlickrPhotosData(array: viewController.photosArray, searchTag: viewController.searchTextField.text!, totalPages: viewController.totalPages)
    }
}
