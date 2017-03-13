//
//  FlickrPhotoCollectionViewCell.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 11/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit
import SDWebImage

class FlickrPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configureCell(flickrImageData: FlickrPhotoModel) {
            self.photoImageView.alpha = 0
            self.photoImageView.sd_setImage(with: flickrImageData.photoUrl as URL, completed: { (image, error, cacheType, url) in
                self.photoImageView.image = image
                UIView.animate(withDuration: 0.3, animations: {
                    self.photoImageView.alpha = 1
                })
            })
    }
}
