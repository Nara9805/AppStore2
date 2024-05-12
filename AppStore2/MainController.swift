//
//  MainController.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 03.12.2023.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var topFreeData: FeedModel?
    var topPaidData: FeedModel?
    
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    func setupCollectionView() {
        collectionView.register(BannerMainCell.self, forCellWithReuseIdentifier: cellId1)
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: cellId2)
        collectionView.register(AppsCell.self, forCellWithReuseIdentifier: cellId3)
    }
    
    
    func fetchData() {
        Service.shared.getTopApps(string: "top-free") { feeds, error in
            if let error = error {
                print("Error top free \(error)")
                return
            }
            
            if let feed = feeds?.feed {
                self.topFreeData = feed
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
        Service.shared.getTopApps(string: "top-paid") { feeds, error in
            if let error = error {
                print("Error top paid \(error)")
                return
            }
            
            if let feed = feeds?.feed {
                self.topPaidData = feed
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! BannerMainCell
            return cell
            
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! AppsCell
            cell.topData = self.topFreeData
            cell.didSelectHandler = { index in
                let vc = DetailViewController(collectionViewLayout: UICollectionViewFlowLayout())
                vc.appData = self.topFreeData?.results[index]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
            
        } else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath) as! AppsCell
            cell.topData = self.topPaidData
            cell.didSelectHandler = { index in
                let vc = DetailViewController(collectionViewLayout: UICollectionViewFlowLayout())
                vc.appData = self.topPaidData?.results[index]
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: 150)
        } else {
            let perCellHeight: CGFloat = 90.0
            let spaces: CGFloat = 5.0
            
            let height = (perCellHeight * 3) + (spaces * 2
            )
            return CGSize(width: collectionView.frame.width,  height: height)
        }
    }
    
}


