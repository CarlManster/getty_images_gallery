//
//  MainViewController+UICollectionViewDataSource.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit
import SDWebImage

extension MainViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mainImages?.count ?? 0
        case 1:
            return relatedImages?.count ?? 0
        default:
            return 0
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TitleHeaderView", for: indexPath)
        
        if let cell = cell as? TitleHeaderView {
            switch indexPath.section {
            case 0:
                cell.titleLabel.text = "Main (\(mainImages?.count ?? 0))"
            case 1:
                cell.titleLabel.text = "Related (\(relatedImages?.count ?? 0))"
            default:
                break
            }
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath)
        
        if let cell = cell as? ThumbnailCell {
            switch indexPath.section {
            case 0:
                if let urlString = mainImages?[indexPath.row], let url = URL(string: urlString) {
                    cell.imageView.sd_setImage(with: url, completed: nil)
                }
            case 1:
                if let urlString = relatedImages?[indexPath.row], let url = URL(string: urlString) {
                    cell.imageView.sd_setImage(with: url, completed: nil)
                }
            default:
                break
            }
        }
        
        return cell
    }
}
