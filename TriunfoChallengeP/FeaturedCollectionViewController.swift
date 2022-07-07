//
//  FeaturedCollectionViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 06/07/22.
//

import UIKit

class FeaturedCollectionViewController: UICollectionViewController {
    
    static let identifier = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewController.identifier)

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewController.identifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
}
