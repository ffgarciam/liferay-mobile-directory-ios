//
//  ImageHelper.swift
//  MobilePeopleDirectory
//
//  Created by alejandro soto on 1/24/15.
//  Copyright (c) 2015 Rivet Logic. All rights reserved.
//

import UIKit
import Foundation

class ImageHelper: NSObject {
    
    private var _processedImages = [String: UIImage]()
    
    // Adds styles to list thubmnails
    func addThumbnailStyles(imageView: UIImageView!, radius: CGFloat!) {
    
        imageView?.layer.cornerRadius = radius
        imageView?.layer.masksToBounds = true
        imageView?.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView?.layer.borderWidth = 1.0
        
    }
    
    // Adds blur style to bg portrait image
    func addBlurStyles(imageView: UIImageView!) {
        var ciContext = CIContext(options: nil)
        var image = CIImage(image: imageView?.image)
        var ciFilter = CIFilter(name: "CIGaussianBlur")
        ciFilter.setValue(image, forKey: kCIInputImageKey)
        
        ciFilter.setValue(8, forKey: "inputRadius")
        var cgImage = ciContext.createCGImage(ciFilter.outputImage, fromRect: image.extent())?
        var blurredImage = UIImage(CGImage: cgImage)!
        
        imageView?.image = blurredImage
        
    }

    // add image to view from NSData
    func addImageFromData(imageView: UIImageView!, image: NSData!) {
        var image = UIImage(data: image!)
        imageView?.image = image

    }
    
    // get image data based on image url
    func getImageData(imageUrl: String) -> NSData {
        let url = NSURL(string: imageUrl)
        return NSData(contentsOfURL: url!)!
    }
    
    // verifies if image is default liferay image or custom portrait image, basically to avoid storing
    // default images on local storage
    func hasUserImage(userImage: NSString) -> Bool {
        return !userImage.containsString("img_id=0") && userImage.length > 0
    }
    
}
