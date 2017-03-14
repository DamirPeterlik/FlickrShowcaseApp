//
//  Progressable.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 14/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol Progressable {
    func showLoading()
    func hideLoading()
}

extension Progressable where Self: UIViewController {
    
    func showLoading() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoading() {
        for subview in view.subviews {
            if subview is UIActivityIndicatorView {
                subview.removeFromSuperview()
            }
        }
    }
}
