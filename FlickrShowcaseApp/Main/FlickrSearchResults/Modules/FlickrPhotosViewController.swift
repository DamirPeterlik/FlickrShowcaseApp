//
//  FlickrPhotosViewController.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotosViewControllerOutput: class {
    func goToFlickrPhotoDetailsVC()
    func sendDataToFlickrDetailsVC(segue: UIStoryboardSegue)
}

protocol FlickrPhotosViewControllerInput: class {
}

class FlickrPhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: FlickrPhotosPresenter!
    
    var photosArray: [FlickrPhotoModel] = []
    var searchText: String!
    var currentPage = 1
    var totalPageCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        FlickrPhotosInterface.sharedInstance.configure(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        title = searchText
        navigationController?.navigationBar.backItem?.title = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.sendDataToFlickrDetailsVC(segue: segue)
    }
    
}

extension FlickrPhotosViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if currentPage < totalPageCount {
            return photosArray.count + 1
        }
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < photosArray.count {
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as FlickrPhotoCollectionViewCell
            let flickrPhoto = photosArray[indexPath.row]
            cell.configureCell(flickrImageData: flickrPhoto)
            return cell
        }
        currentPage += 1
        presenter.getPhotos(for: searchText, page: currentPage)
        
        return collectionView.dequeueReusableCell(forIndexPath: indexPath) as FlickrLoadingCollectionViewCell
    }
}

extension FlickrPhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.goToFlickrPhotoDetailsVC()
    }
}

extension FlickrPhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var collectionCellWidth: CGSize
        let width = (UIScreen.main.bounds.width) / 3 - 1
        
        if indexPath.row < photosArray.count {
            collectionCellWidth = CGSize(width: width, height: width)
        } else {
            collectionCellWidth = CGSize(width: collectionView.bounds.width, height: 50)
        }
        return collectionCellWidth
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
}

extension FlickrPhotosViewController: FlickrSearchViewControllerInput {
    
    func showPhotos(photos: [FlickrPhotoModel], totalPagesCount: Int, totalImagesCount: Int) {
        self.collectionView.performBatchUpdates({
            self.collectionView.insertItems(at: (self.collectionView?.indexPathsForVisibleItems)!)
            let indexes: IndexSet = [0]
            self.collectionView.reloadSections(indexes)
            self.photosArray.append(contentsOf: photos)
            self.totalPageCount = totalPagesCount
        }, completion: nil)
    }
    
    func showError(errorMessage: String) {
        print(errorMessage)
    }
    
}




