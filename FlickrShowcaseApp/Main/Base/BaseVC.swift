//
//  BaseVC.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 13/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, Progressable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
