//
//  FlickrPhotoModel.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation
import Unbox

//https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg
//https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_[mstzb].jpg

/*
 
 s	small square 75x75
 q	large square 150x150
 t	thumbnail, 100 on longest side
 m	small, 240 on longest side
 n	small, 320 on longest side
 -	medium, 500 on longest side
 z	medium 640, 640 on longest side
 c	medium 800, 800 on longest side†
 b	large, 1024 on longest side*
 h	large 1600, 1600 on longest side†
 k	large 2048, 2048 on longest side†
 o	original image, either a jpg, gif or png, depending on source format
 
 */


struct FlickrPhotoModel {
    let farmID: Int
    let serverID: String
    let photoID: String
    let secret: String
    let title: String
    
    var photoUrl: NSURL {
        return flickrImageURL()
    }
    
    var largePhotoUrl: NSURL {
        return flickrImageURL(size: "b")
    }
    
    private func flickrImageURL(size: String = "m") -> NSURL {
        return NSURL(string: "https://farm\(farmID).staticflickr.com/\(serverID)/\(photoID)_\(secret)_\(size).jpg")!
    }
}

extension FlickrPhotoModel: Unboxable {
    init(unboxer: Unboxer) throws {
        self.farmID = try unboxer.unbox(key: "farm")
        self.serverID = try unboxer.unbox(key: "server")
        self.photoID = try unboxer.unbox(key: "id")
        self.secret = try unboxer.unbox(key: "secret")
        self.title = try unboxer.unbox(key: "title")
    }
}
