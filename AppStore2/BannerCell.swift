//
//  BannerCell.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 10.12.2023.
//

import UIKit

class BannerCell: UICollectionViewCell{
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Announcing the 2023 App Store Awards"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(contentImageView)
        contentImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        contentImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true 
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
