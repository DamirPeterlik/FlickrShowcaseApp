//
//  FlickrPhotoDetailsViewController.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol FlickrPhotoDetailsInput: class {
    func loadPreparedPhotoImage(image: UIImage)
}

protocol FlickrPhotoDetailsOutput: class {
    func prepareSelectedFlickrPhotoModel(photoModel: FlickrPhotoModel)
    func loadLargeFlickrPhotoModelImage()
}

class FlickrPhotoDetailsViewController: BaseVC, FlickrPhotoDetailsInput {

    @IBOutlet weak var flickrPhotoImageView: UIImageView!
    @IBOutlet weak var flickrPhotoTitleLabel: UILabel!
    
    var presenter: FlickrPhotoDetailsOutput!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FlickrPhotoDetailsInterface.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        presenter.loadLargeFlickrPhotoModelImage()
    }

    func loadPreparedPhotoImage(image: UIImage) {
        flickrPhotoImageView.image = image
        self.hideLoading()
    }
}
