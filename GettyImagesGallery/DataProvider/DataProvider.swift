//
//  DataProvider.swift
//  GettyImagesGallery
//
//  Created by Carl Manster on 2017. 9. 17..
//  Copyright © 2017년 Jong-min, Choi. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class DataProvider: NSObject {
    static let baseURL = "http://www.gettyimagesgallery.com"
    static let pagePath = "/collections/archive/slim-aarons.aspx"
 
    class func fetchImageList(_ completion: @escaping ((Bool, [String : [String]]?) -> Void)) {
        Alamofire.request("\(baseURL)\(pagePath)").responseString { response in
            guard let httpResponse = response.response, httpResponse.statusCode < 300 else {
                completion(false, nil)
                return
            }
            
            guard let data = response.data, let htmlString = String(data: data, encoding: .utf8) else {
                completion(false, nil)
                return
            }
            
            guard let htmlDoc = HTML(html: htmlString, encoding: .utf8) else {
                completion(false, nil)
                return
            }
            
            var result: [String : [String]] = [:]
            
            // Main Slider
            let slider = htmlDoc.xpath(".//*[@id='slider']/ul[1]/li/img")
            
            var mainImage: [String] = []
            
            for link in slider {
                if let imgSrc = link["src"], imgSrc.isEmpty == false {
                    mainImage.append("\(baseURL)\(imgSrc)")
                }
            }
            
            result.updateValue(mainImage, forKey: "mainImages")
            
            // Related Images
            let related = htmlDoc.xpath(".//*[@class='gallery-wrap exhibitionrepeater']/div/a[1]/img[1]")
            
            var relatedImage: [String] = []
            
            for link in related {
                if let imgSrc = link["src"], imgSrc.isEmpty == false {
                    relatedImage.append("\(baseURL)\(imgSrc)")
                }
            }
            
            result.updateValue(relatedImage, forKey: "relatedImages")
            
            completion(true, result)
        }
    }
}
