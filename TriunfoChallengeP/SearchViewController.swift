//
//  SearchViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 06/07/22.
//

import UIKit
import iCarousel

class SearchViewController: UIViewController, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 6
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 120))
        view.backgroundColor = .red
        return view
    }
    
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow2
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let kit = teste()
        let logoImage: UIImageView = kit.0
        let titleLudi: UILabel = kit.1
        let stackTitle: UIStackView = kit.2
        
        myCarousel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 200)
        myCarousel.dataSource = self
        self.view.addSubview(myCarousel)
        
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
