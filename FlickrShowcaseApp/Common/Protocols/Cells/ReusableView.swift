//
//  ReusableView.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 11/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
