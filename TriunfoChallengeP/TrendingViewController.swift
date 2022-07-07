//
//  TrendingViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 06/07/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        let kit = teste()
        let logoImage: UIImageView = kit.0
        let titleLudi: UILabel = kit.1
        let stackTitle: UIStackView = kit.2
        
        stackTitle.addArrangedSubview(logoImage)
        stackTitle.addArrangedSubview(titleLudi)
        
        // Autolayout
        
        stackTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackTitle.heightAnchor.constraint(equalToConstant: 64.0),
        ])
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: 34),
        ])
        
        navigationItem.titleView = stackTitle

    }

}


