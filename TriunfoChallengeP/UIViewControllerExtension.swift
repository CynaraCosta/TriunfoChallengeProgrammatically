//
//  UIViewControllerExtension.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 07/07/22.
//

import Foundation
import UIKit

extension UIViewController{
    
    func teste() -> (UIImageView, UILabel, UIStackView){
        let logoImage: UIImageView
        let image = UIImage(named: "logo")
        logoImage = UIImageView(image: image)
        logoImage.contentMode = .scaleAspectFit

        
        let titleLudi: UILabel
        titleLudi = UILabel()
        titleLudi.textColor = .white
        titleLudi.text = "Ludi"
        titleLudi.font = UIFont(name: "Oswald-Medium", size: 24)

        
        let stackTitle: UIStackView
        stackTitle = UIStackView()
        stackTitle.axis = NSLayoutConstraint.Axis.horizontal
        stackTitle.distribution  = UIStackView.Distribution.equalSpacing
        //stackTitle.alignment = UIStackView.Alignment.center
        stackTitle.spacing  = 8.0
        
        return (logoImage, titleLudi, stackTitle)
    }
    
    
    
}

