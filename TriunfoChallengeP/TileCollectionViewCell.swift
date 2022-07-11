//
//  TileCollectionViewCell.swift
//  TriunfoChallengeP
//
//  Created by Cynara Costa on 11/07/22.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let backgroundColor: UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Quicksand-rEGULAR", size: 17)

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
    
}
