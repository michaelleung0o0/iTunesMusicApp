//
//  BaseRequest.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import Foundation
import Alamofire

struct RestApiConstants{
    static let BASE_URL = "https://itunes.apple.com"
    static let SEARCH = "/search?term="
    static let GET_TRACK = "/lookup?entity=song&id="
}

class BaseRequest{

    func createGetRequest(endPoint:String, header: HTTPHeaders? )->DataRequest?{
        let url = RestApiConstants.BASE_URL + endPoint
        print("request url =\(url)")
        return  Alamofire.request( url,
                                   method: .get,
                                   parameters: nil,
                                   encoding: JSONEncoding.default,
                                   headers: header)
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint(self)
        #endif
        return self
    }
}
