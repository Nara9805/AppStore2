//
//  MusicController.swift
//  AppStore2
//
//  Created by Smart Castle M1A2009 on 30.12.2023.
//

import UIKit

class MusicController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var musicData = [ResultModel]()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    
    func setupCollectionView() {
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func fetchData() {
        Service.shared.getMusicList { (res, err) in
            
            if let err = err {
                print("Failed to fetch apps:" , err)
                return
            }
            
            self.musicData = res?.feed.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        cell.configure(musicData[indexPath.item])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 90)
    }
}
