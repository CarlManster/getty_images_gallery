//
//  SubViewController+UIScrollViewDelegate.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 18..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit

extension SubViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
