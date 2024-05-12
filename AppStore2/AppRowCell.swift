//
//  AppRowCell.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 03.12.2023.
//

import UIKit

class AppRowCell: UICollectionViewCell{
    
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Monopoly"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Game for company"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var getButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    func setupUI() {
        addSubview(contentImageView)
        contentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        contentImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        contentImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        contentImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentImageView.rightAnchor, constant: 10).isActive = true
        
        addSubview(descLabel)
        descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        
        addSubview(getButton)
        getButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        getButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        getButton.leftAnchor.constraint(greaterThanOrEqualTo: nameLabel.rightAnchor, constant: 20).isActive = true
        

    }
    
    func configure(_ data: ResultModel?) {
        nameLabel.text = data?.name
        descLabel.text = data?.artistName
        contentImageView.downloaded(from: data?.artworkUrl100 ?? "")
    }
    
    func configure(_ data: SearchResultModel?) {
        nameLabel.text = data?.trackName
        descLabel.text = data?.artistName
        contentImageView.downloaded(from: data?.artworkUrl100 ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
