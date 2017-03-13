//
//  Constants.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 13/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation

// MARK: - View Controller Identifier -



// MARK: - segue Identifier -


let flickrPhotosVCsegue = "FlickrPhotosViewControllerSegue"
let flickrPhotoDetailsVCsegue = "FlickrPhotoDetailsViewControllerSegue"

// MARK: - error messages -


let wrongSearchTag = "Write a search tag."
let okErrorMessage = "OK"
let defaultErrorMessage = "Default error message."
let networkErrorGeneralMessage = "No images for searched tag."
let networkErrorAlamofireMessage = "Alamofire error:"
let networkErrorUnboxMessage = "Unbox error:"


// MARK: - networking - 

let FLICKR_API_KEY: String = "44d1d8cdb03202ec9edd7618f46bcb9c"
let FLICKR_URL: String = "https://api.flickr.com/services/rest/"
let SEARCH_METHOD: String = "flickr.photos.search"
let FORMAT_TYPE: String = "json"
let JSON_CALLBACK: Int = 1
let PRIVACY_FILTER: Int = 1
