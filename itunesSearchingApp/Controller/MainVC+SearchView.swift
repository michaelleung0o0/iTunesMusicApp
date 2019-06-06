//
//  MainVC+SearchView.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import UIKit
import Alamofire

extension MainVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil || searchBar.text != "" {
//            DataService.instance.getAlbums(searchRequest: searchBar.text!) { (requestedAlbums) in
//                self.albums = requestedAlbums.sorted(by: {$0.collectionName < $1.collectionName})
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            }
            fetchData()
        }
        searchBar.resignFirstResponder()
    }
    
        func fetchData(){
            let request = GetMusicRequest()
            print("🙀🙀===start requet===🙀🙀")
            request.sendRequest(input: searchBar.text!).responseObject{ (response: DataResponse<SearchResponse>) in
                if let searchResponse = response.result.value{
                    if let items =  searchResponse.results{
                        print("success ==> 🙀🙀🙀🙀🙀")
                        self.albums = items.sorted(by: {$0.collectionName! < $1.collectionName!})
//                        print(self.albums)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }else{
                        print("error ==> 🙀🙀🙀🙀🙀")
                        print(searchResponse.toJSONString() as Any)
                    }
                }
    
            }
            print("🙀🙀===end===🙀🙀")
        }
}
