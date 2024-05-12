//
//  DetailViewController.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 24.12.2023.
//

import UIKit

class DetailViewController:
    UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var appData: ResultModel? {
        didSet {
            self.fetchDetailInfo(id: appData?.id ?? "")
            }
    }
    var detailData: SearchResultModel?
    
    let cellId1 = "cellId1"
    let cellId2 = "cellId2"
    let cellId3 = "cellId3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellId1)
        collectionView.register(ScreenMainCell.self, forCellWithReuseIdentifier: cellId2)
        collectionView.register(Review.self, forCellWithReuseIdentifier: cellId3)
    }
    
    func fetchDetailInfo(id: String) {
        Service.shared.getDetailsForApp(appId: id) { result, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            
            if let data = result?.results.first(where: {model in
                model.trackId == Int(id)
            }) {
                self.detailData = data
                print("results = \(data)")
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
     }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath) as! AppDetailCell
            cell.configure(detailData)
            
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! ScreenMainCell
            cell.detailData = detailData
            return cell
        } else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath) as! Review
            return cell
        }
        
        return UICollectionViewCell()
}

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: 200)
        } else if indexPath.item == 1 {
            return CGSize(width: collectionView.frame.width, height: 600)
        } else {
            return CGSize(width: collectionView.frame.width, height: 150)
        }
        }
    }
    
