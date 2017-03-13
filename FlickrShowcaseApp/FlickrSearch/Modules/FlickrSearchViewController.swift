//
//  FlickrSearchViewController.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrSearchViewControllerOutput: class {
    func getPhotos(for searchText: String, page: Int)
}

protocol FlickrSearchViewControllerInput: class {
    func showPhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int)
    func showError(errorMessage: String)
}

class FlickrSearchViewController: UIViewController, FlickrSearchViewControllerInput, Alertable {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var startFlickrButton: UIButton!

    var presenter: FlickrSearchViewControllerOutput!
    var photosArray: [FlickrPhotoModel] = []
    var totalPages: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FlickrSearchInterface.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func startFlickrPressed () {
        guard let searchText = searchTextField.text, searchText != "" else {
            self.showAlertWithMessage(message: wrongSearchTag)
            return
        }
        photosArray = []
        presenter.getPhotos(for: searchText, page: 1)
    }
    
    func showPhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        photosArray.append(contentsOf: photos)
        self.totalPages = totalPagesCount
        
        performSegue(withIdentifier: flickrPhotosVCsegue, sender: self)
    }

    func showError(errorMessage: String) {
        self.showAlertWithMessage(message: errorMessage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == flickrPhotosVCsegue {
            if let photosVC = segue.destination as? FlickrPhotosViewController {
                photosVC.searchText = searchTextField.text!
                photosVC.photosArray = photosArray
                photosVC.totalPageCount = totalPages
            }
        }
    }
}




