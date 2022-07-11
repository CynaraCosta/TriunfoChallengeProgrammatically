//
//  ViewController.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 05/07/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let scrollView = UIScrollView()
    let contentView = UIView()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private let popularLabel: UILabel = {
        let popularLabel = UILabel()
        popularLabel.textColor = .white
        popularLabel.text = "Popular"
        popularLabel.font = UIFont(name: "Quicksand-Medium", size: 25)
        // popularLabel.font = UIFont(name: "Nunito-ExtraBold", size: 25)
        return popularLabel
    }()
    
    private let seeAllButton: UIButton = {
        let seeAllButton = UIButton()
        seeAllButton.frame = CGRect(x: 0, y: 0, width: 69, height: 42)
        seeAllButton.setTitle("See all", for: .normal)
        seeAllButton.titleLabel?.font = UIFont(name: "Quicksand-Medium", size: 16)
        seeAllButton.setTitleColor(UIColor.white, for: .normal)
        seeAllButton.backgroundColor = .clear
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
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
        viewModels: [
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
            TileCollectionViewCellViewModel(name: "Título do filme", image: "fotinha"),
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor(named: "purple1")?.cgColor, UIColor(named: "purple2")?.cgColor]
        
        stackPopular.addArrangedSubview(popularLabel)
        stackPopular.addArrangedSubview(seeAllButton)
        
        self.view.layer.insertSublayer(gradient, at: 0)
        self.view.addSubview(scrollView)
        
        contentView.addSubview(stackPopular)
        scrollView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackPopular.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: stackPopular.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: stackPopular.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 540),
        ])
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 
    }
}

