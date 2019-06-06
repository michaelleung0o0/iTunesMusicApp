//
//  ViewController.swift
//  itunesSearchingApp
//
//  Created by Leung Michael on 6/6/2019.
//  Copyright © 2019 Leung Michael. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var albums = [Album]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .automatic
        }
        let indentation = (self.view.bounds.size.width - 300) / 4
        collectionView.contentInset = UIEdgeInsets(top: indentation, left: indentation, bottom: indentation, right: indentation)
        
        addShadowToNavigationBar()
    }
    
    func addShadowToNavigationBar() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AlbumDetailVC" {
            if let destinationVC = segue.destination as? AlbumDetailVC {
                if let album = sender as? Album {
                    destinationVC.album = album
                    let index = albums.index(where: {$0 === album})
                    let indexPath = IndexPath(row: index!, section: 0)
                    if let cell = collectionView.cellForItem(at: indexPath) as? AlbumCell {
                        destinationVC.image = cell.albumImage.image
                    }
                }
            }
        }
    }
}

