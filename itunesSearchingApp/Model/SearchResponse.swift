//
//  SearchResponse.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResponse: Mappable {
    
    var resultCount:Int?
    var results:[Album]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        //map error element first
        resultCount <- map["resultCount"]
        results <- map["results"]
        //end
        
    }
    
}

class Album: Mappable{
    
    var artistName: String?
    var artworkUrl100: String?
    var collectionId: Int?
    var collectionName: String?
    var country: String?
    var primaryGenreName: String?
    var releaseDate: String?
    var previewUrl: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        artistName <- map["artistName"]
        artworkUrl100 <- map["artworkUrl100"]
        collectionId <- map["collectionId"]
        collectionName <- map["collectionName"]
        country <- map["country"]
        primaryGenreName <- map["primaryGenreName"]
        releaseDate <- map["releaseDate"]
        previewUrl <- map["previewUrl"]
    }
}

