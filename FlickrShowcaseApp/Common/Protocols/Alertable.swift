//
//  Alertable.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 11/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

protocol Alertable {
    func showAlertWithMessage(message: String)
}

extension Alertable where Self: UIViewController {
    func showAlertWithMessage(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: okErrorMessage, style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}
