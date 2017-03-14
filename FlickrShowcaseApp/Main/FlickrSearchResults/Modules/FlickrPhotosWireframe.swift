//
//  FlickrPhotosWireframe.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotosWireframeInput: class {
    func navigateToFlickrPhotoDetailsVC()
    func sendDataToFlickrDetailsVC(segue: UIStoryboardSegue)
}

class FlickrPhotosWireframe: FlickrPhotosWireframeInput {
    
    weak var viewController: FlickrPhotosViewController!
    
    func navigateToFlickrPhotoDetailsVC() {
        viewController.performSegue(withIdentifier: flickrPhotoDetailsVCsegue, sender: nil)
    }
    
    func sendDataToFlickrDetailsVC(segue: UIStoryboardSegue) {
        if segue.identifier == flickrPhotoDetailsVCsegue {
            prepareDataToBeSent(segue: segue)
        }
    }
    
    func prepareDataToBeSent(segue: UIStoryboardSegue) {
        if let selectedIndexPath = viewController.collectionView.indexPathsForSelectedItems?.first {
            let selectedFlickrPhotoModel = viewController.photosArray[selectedIndexPath.row]
            let showFlickrDetailVC = segue.destination as! FlickrPhotoDetailsViewController
            showFlickrDetailVC.presenter.prepareSelectedFlickrPhotoModel(photoModel: selectedFlickrPhotoModel)
        }
    }
}
