//
//  GetTrackRequest.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class GetTrackRequest:BaseRequest{
    
    func sendRequest(input: String)->DataRequest{
        return createGetRequest(endPoint:RestApiConstants.GET_TRACK + input, header: nil)!
    }
}
