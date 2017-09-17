//
//  MainViewController+UICollectionViewDelegate.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath == \(indexPath)")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let subViewController = storyBoard.instantiateViewController(withIdentifier: "SubViewController") as? SubViewController else {
            return
        }
        
        var imageURLString: String?
        
        switch indexPath.section {
        case 0:
            imageURLString = self.mainImages?[indexPath.row]
        case 1:
            imageURLString = self.relatedImages?[indexPath.row]
        default:
            break
        }
        
        if let imageURLString = imageURLString {
            subViewController.imageURLString = imageURLString
            
            let backButton = UIBarButtonItem()
            backButton.title = "Back"
            
            self.navigationItem.backBarButtonItem = backButton
            
            self.navigationController?.pushViewController(subViewController, animated: true)
        }
    }
}
