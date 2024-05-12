//
//  ScreenCell.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 24.12.2023.
//

import UIKit

class ScreenCell: UICollectionViewCell{
    
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(contentImageView)
        contentImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
