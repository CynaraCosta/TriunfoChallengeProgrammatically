//
//  TabBarViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 05/07/22.
//

import UIKit

class TabBar: UITabBarController {

    private let stackTitle: UIStackView = {
        let stackTitle = UIStackView()
        stackTitle.axis = NSLayoutConstraint.Axis.horizontal
        stackTitle.distribution  = UIStackView.Distribution.equalSpacing
        stackTitle.alignment = UIStackView.Alignment.center
        stackTitle.spacing  = 8.0
        return stackTitle
    }()
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        //navController.navigationBar.barTintColor = UIColor(named: "secondBlack")?.withAlphaComponent(0.5)
        
        navController.navigationBar.barTintColor = .clear
        navController.navigationBar.isTranslucent = true
                
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
                
        navController.navigationBar.prefersLargeTitles = true
        
        if navController.tabBarItem.title == "Featured"{
            rootViewController.navigationItem.title = title
            rootViewController.navigationItem.titleView = stackTitle
        } else {
            rootViewController.navigationItem.title = title
        }
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Oswald-Regular", size: 48)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        //navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        return navController
      }
    
    
    func setupVCs() {
           viewControllers = [
               createNavController(for: ViewController(), title: NSLocalizedString("Featured", comment: ""), image: UIImage(systemName: "film")!),
               createNavController(for: TrendingViewController(), title: NSLocalizedString("Trending", comment: ""), image: UIImage(systemName: "flame")!),
               createNavController(for: SearchViewController(), title: NSLocalizedString("Search", comment: ""), image: UIImage(systemName: "magnifyingglass")!)
           ]
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "secondBlack")
        
        //UITabBar.appearance().barTintColor = UIColor(named: "secondBlack")
        tabBar.tintColor = .white
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
        setupVCs()
        
        let kit = teste()
        let logoImage: UIImageView = kit.0
        let titleLudi: UILabel = kit.1
        
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
        
    }

}
