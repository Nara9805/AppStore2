//
//  ScreenMainCell.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 24.12.2023.
//

import UIKit

class ScreenMainCell: UICollectionViewCell {
    
    var detailData: SearchResultModel? {
        didSet {
            DispatchQueue.main.async {
                self.horizontalCollectionView.reloadData()
            }
        }
    }
    
    lazy var horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupUI()
    }
    
    func setupCollectionView() {
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.backgroundColor = .white
        
        horizontalCollectionView.register(ScreenCell.self, forCellWithReuseIdentifier: "cellId")
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalCollectionView.isPagingEnabled = true
        if let flowLayout = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
    }
    
    func setupUI() {
        addSubview(horizontalCollectionView)
        horizontalCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        horizontalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        horizontalCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScreenMainCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ScreenCell
        cell.backgroundColor = .white
        cell.contentImageView.downloaded(from: detailData?.screenshotUrls[indexPath.item] ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailData?.screenshotUrls.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
