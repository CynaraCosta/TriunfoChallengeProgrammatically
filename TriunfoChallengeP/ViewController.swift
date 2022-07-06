//
//  ViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 05/07/22.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    private let popularLabel: UILabel = {
        let popularLabel = UILabel()
        popularLabel.textColor = .label
        popularLabel.text = "Popular"
        popularLabel.font = UIFont(name: "Helvetica Neue", size: 28)
        // popularLabel.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        return popularLabel
    }()
    
    private let seeAllButton: UIButton = {
        let seeAllButton = UIButton()
        seeAllButton.frame = CGRect(x: 0, y: 0, width: 69, height: 42)
        seeAllButton.setTitle("See all", for: .normal)
        seeAllButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 17)
        seeAllButton.setTitleColor(UIColor(named: "vermelho"), for: .normal)
        seeAllButton.backgroundColor = .systemBackground
        return seeAllButton
    }()
    
    private let stackPopular: UIStackView = {
        let stackPopular = UIStackView()
        stackPopular.axis = NSLayoutConstraint.Axis.horizontal
        stackPopular.distribution  = UIStackView.Distribution.equalSpacing
        stackPopular.alignment = UIStackView.Alignment.center
        stackPopular.spacing   = 16.0
        return stackPopular
    }()
    
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        stackPopular.addArrangedSubview(popularLabel)
        stackPopular.addArrangedSubview(seeAllButton)
        
        self.view.addSubview(scrollView)
        contentView.addSubview(stackPopular)
        scrollView.addSubview(contentView)
        
        // Autolayout
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        stackPopular.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackPopular.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            stackPopular.heightAnchor.constraint(equalToConstant: 58.0),
            stackPopular.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackPopular.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackPopular.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])
        
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            popularLabel.centerYAnchor.constraint(equalTo: stackPopular.centerYAnchor),
        ])
        
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seeAllButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            seeAllButton.centerYAnchor.constraint(equalTo: stackPopular.centerYAnchor),
        ])
    }
}

