//
//  TabBarViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 05/07/22.
//

import UIKit

class TabBar: UITabBarController {

    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
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
        UITabBar.appearance().barTintColor = .tertiarySystemBackground
        tabBar.tintColor = .label
        setupVCs()
    }

}
