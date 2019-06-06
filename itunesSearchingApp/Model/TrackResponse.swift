//
//  TrackResponse.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import Foundation
import ObjectMapper

class TrackResponse: Mappable {
    
    var resultCount:Int?
    var results:[Track]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        //map error element first
        resultCount <- map["resultCount"]
        results <- map["results"]
        //end
        
    }
    
}

class Track: Mappable{
    
    var trackName: String?
    var trackNumber: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        trackName <- map["trackName"]
        trackNumber <- map["trackNumber"]
    }
}


