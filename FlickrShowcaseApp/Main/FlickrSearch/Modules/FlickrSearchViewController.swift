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
    func goToFlickrPhotosVC()
    func sendDataToFlickrPhotosVC(segue: UIStoryboardSegue)
}

protocol FlickrSearchViewControllerInput: class {
    func showPhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int)
    func showError(errorMessage: String)
}

class FlickrSearchViewController: BaseVC, FlickrSearchViewControllerInput, Alertable {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var startFlickrButton: UIButton!

    var presenter: FlickrSearchPresenter!
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
        navigationController?.isNavigationBarHidden = true
        searchTextField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func startFlickrPressed () {
        startFlickrButton.isEnabled = false
        guard let searchText = searchTextField.text, searchText != "" else {
            showAlertWithMessage(message: wrongSearchTag)
            startFlickrButton.isEnabled = true
            return
        }
        showLoading()
        photosArray = []
        presenter.getPhotos(for: searchText, page: 1)
    }
    
    func showPhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        photosArray.append(contentsOf: photos)
        totalPages = totalPagesCount
        searchTextField.resignFirstResponder()
        presenter.goToFlickrPhotosVC()
        clearUIforNewSearch()
    }

    func showError(errorMessage: String) {
        showAlertWithMessage(message: errorMessage)
        clearUIforNewSearch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.sendDataToFlickrPhotosVC(segue: segue)
    }
    
    func clearUIforNewSearch() {
        hideLoading()
        startFlickrButton.isEnabled = true
        searchTextField.text = ""
    }
    
}

