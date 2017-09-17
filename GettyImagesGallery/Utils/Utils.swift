//
//  Utils.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit

struct Screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let scale = UIScreen.main.scale

    static let iPhone4Height: CGFloat = 480.0
    static let iPhone5Height: CGFloat = 568.0
    static let iPhone6Height: CGFloat = 667.0
    static let iPhone6PlusHeight: CGFloat = 736.0
    static let iPadHeight: CGFloat = 1024.0
    static let iPadProHeight: CGFloat = 1366.0
}

struct Device {
    static let isIPhone4 = Double(fabs(Screen.height - Screen.iPhone4Height)) < Double.ulpOfOne
    static let isIPhone5 = Double(fabs(Screen.height - Screen.iPhone5Height)) < Double.ulpOfOne
    static let isIPhone6 = Double(fabs(Screen.height - Screen.iPhone6Height)) < Double.ulpOfOne
    static let isIPhone6Plus = Double(fabs(Screen.height - Screen.iPhone6PlusHeight)) < Double.ulpOfOne
    static let isIPad = Double(fabs(Screen.height - Screen.iPadHeight)) < Double.ulpOfOne
    static let isIPadPro = Double(fabs(Screen.height - Screen.iPadProHeight)) < Double.ulpOfOne
    
    static let isIPadFamily = isIPad || isIPadPro
}

