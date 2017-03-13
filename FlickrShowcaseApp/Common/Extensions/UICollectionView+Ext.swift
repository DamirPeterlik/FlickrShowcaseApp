//
//  UICollectionView+Ext.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 11/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}

extension UICollectionViewCell: ReusableView {}
