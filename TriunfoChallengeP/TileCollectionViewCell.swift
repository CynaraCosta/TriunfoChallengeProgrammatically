//
//  TileCollectionViewCell.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 11/07/22.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let image: String
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont(name: "Quicksand-Regular", size: 17)

        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        imageView.frame = contentView.bounds
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
        ])
        
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel){
        let image = UIImage(named: viewModel.image)
        imageView.image = image
        label.text = viewModel.name
    }
    
}
