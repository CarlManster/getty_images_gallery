//
//  MainViewController.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let itemPerRow: Int = Device.isIPadFamily ? 6 : 3
    let gapWidth: CGFloat = 2.0
    
    var mainImages: [String]?
    var relatedImages: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ThumbnailCell", bundle: nil), forCellWithReuseIdentifier: "ThumbnailCell")
        collectionView.register(UINib(nibName: "TitleHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TitleHeaderView")
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        DataProvider.fetchImageList { [weak self] (success, result) in
            guard let strongSelf = self else {
                return
            }
            
            if success, let result = result {
                strongSelf.mainImages = result["mainImages"]
                strongSelf.relatedImages = result["relatedImages"]
            } else {
                strongSelf.mainImages = nil
                strongSelf.relatedImages = nil
            }
            
            strongSelf.collectionView.reloadData()
            strongSelf.indicator.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
