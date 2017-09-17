//
//  SubViewController.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var imageURLString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        imageView.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let urlString = imageURLString, let url = URL(string: urlString) {
            self.imageView.sd_setImage(with: url, completed: { [weak self] (image, error, _, _) in
                guard let strongSelf = self else {
                    return
                }
                
                if let image = image {
                    strongSelf.sizeLabel.text = "\(Int(image.size.width)) x \(Int(image.size.height))"
                } else {
                    strongSelf.sizeLabel.text = ""
                }
            })
        }
        
        scrollView.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
