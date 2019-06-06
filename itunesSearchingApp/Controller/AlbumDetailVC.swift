//
//  AlbumDetailVC.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class AlbumDetailVC: UIViewController {
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var album: Album!
    var image: UIImage!
    var tracks = [Track]()
    
    var audioPlayer: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: album.previewUrl!)
        audioPlayer = AVPlayer(url: url!)
        
        if audioPlayer?.rate == 0{
            audioPlayer.play()
        }

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        updateLabels()
        fetchData()
    }
 
    func fetchData(){
        let request = GetTrackRequest()
        print("🙀🙀===start requet===🙀🙀")
        request.sendRequest(input: String(album.collectionId!)).responseObject{ (response: DataResponse<TrackResponse>) in
            if let trackResponse = response.result.value{
                if let items =  trackResponse.results{
                    print("success ==> 🙀🙀🙀🙀🙀")
                    self.tracks = items
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }else{
                    print("error ==> 🙀🙀🙀🙀🙀")
                    print(trackResponse.toJSONString() as Any)
                }
            }
            
        }
        print("🙀🙀===end===🙀🙀")
    }
    
    func updateLabels () {
        albumLabel.text = album.collectionName
        artistLabel.text = album.artistName
        genreLabel.text = album.primaryGenreName
        countryLabel.text = album.country
        yearLabel.text = album.releaseDate
        imageView.image = image
    }
}
