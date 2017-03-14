//
//  FlickrLoadingCollectionViewCell.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 11/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

class FlickrLoadingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        spinner.startAnimating()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        spinner.startAnimating()
    }
}
