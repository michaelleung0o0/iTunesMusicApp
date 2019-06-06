//
//  TrackCell.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackNumber: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    func updateCell (track: Track) {
        trackNumber.text = track.trackNumber
        trackName.text = track.trackName
    }
    
}
