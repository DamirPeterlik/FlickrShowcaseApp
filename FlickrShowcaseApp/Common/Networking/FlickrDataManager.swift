//
//  FlickrDataManager.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation
import Alamofire
import Unbox
import SDWebImage

protocol FlickrDataManagerSearchPhotoProtocol: class {
    func getPhotosFor(searchText: String, page: Int, withSuccess success: @escaping (NSInteger, NSInteger, [FlickrPhotoModel]?) -> (), failure: @escaping (NetworkError) -> ())
}

protocol FlickrDataManagerPhotoLoadProtocol {
    func getImageFromFlickrModel(url: NSURL, success: @escaping (UIImage?, Data?) -> (), failure: @escaping (NetworkError) -> ())
}

class FlickrDataManager: FlickrDataManagerSearchPhotoProtocol, FlickrDataManagerPhotoLoadProtocol {
    
    func getPhotosFor(searchText: String, page: Int, withSuccess success: @escaping (NSInteger, NSInteger, [FlickrPhotoModel]?) -> (), failure: @escaping (NetworkError) -> ()) {
        
        let params = ["method": SEARCH_METHOD, "api_key": FLICKR_API_KEY, "tags": searchText,"privacy_filter": PRIVACY_FILTER, "page" : page, "format": FORMAT_TYPE, "nojsoncallback": JSON_CALLBACK] as [String : Any]
        
        Alamofire.request(FLICKR_URL, method: .get, parameters: params).validate().responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                do {
                    let resultDictionary = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String : AnyObject]
                    guard let photosContainer = resultDictionary?["photos"] as? NSDictionary else { return }
                    guard let totalImagesForSearchTag = photosContainer["total"] as? String else { return }
                    guard let totalPagesForSearchTag = photosContainer["pages"] as? Int else { return }
                    
                    guard let photosArray = photosContainer["photo"] as? [UnboxableDictionary] else {
                        return success(0, 0, [])
                    }
                    
                    if photosArray.count > 0 {
                        let photos: [FlickrPhotoModel] = try unbox(dictionaries: photosArray)
                        let imagesCount = (totalImagesForSearchTag as NSString).integerValue
                        success(imagesCount, totalPagesForSearchTag, photos)
                    } else {
                        let error: NetworkError = .General
                        failure(error)
                    }
                } catch {
                    failure(NetworkError.Unbox(error as! UnboxError))
                }
            case .failure(let error):
                failure(error as! NetworkError)
            }
        }
    }
    
    func getImageFromFlickrModel(url: NSURL, success: @escaping (UIImage?, Data?) -> (), failure: @escaping (NetworkError) -> ()) {
        SDWebImageManager.shared().loadImage(with: url as URL, options: .cacheMemoryOnly, progress: nil) { (image, data, error, cacheType, finished, withUrl) in
            if error != nil {
                failure(error as! NetworkError)
            } else {
                success(image, data)
            }
        }
        
//        let _ = SDWebImageManager.shared().imageDownloader?.downloadImage(with: url as URL, options: SDWebImageDownloaderOptions.allowInvalidSSLCertificates, progress: { (min, max, url) in
//            print("loading……")
//            print(min, max, url!)
//        }, completed: { (image, data, error, finished) in
//            if image != nil {
//                print("finished")
//                success (image, data)
//            } else {
//                print("wrong")
//                failure (error as! NetworkError)
//                
//            }
//        })        
        
    }
    
}
