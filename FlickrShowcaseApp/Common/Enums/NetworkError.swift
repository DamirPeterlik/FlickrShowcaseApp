//
//  NetworkError.swift
//  FlickrShowcaseApp
//
//  Created by Damir Peterlik on 09/03/2017.
//  Copyright © 2017 Damir Peterlik. All rights reserved.
//

import Foundation

import Alamofire
import Unbox

enum NetworkError: Error {
    case General
    case Alamofire(NSError)
    case Unbox(UnboxError)
    
    var message: String {
        switch self {
        case .General:
            return networkErrorGeneralMessage
        case .Alamofire(let error):
            return "\(networkErrorAlamofireMessage) \(error.localizedDescription)"
        case .Unbox(let error):
            return "\(networkErrorUnboxMessage) \(error.description)"
        }
    }
}
