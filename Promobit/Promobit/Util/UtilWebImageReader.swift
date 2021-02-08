//
//  UtilWebImageReader.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class UtilWebImageReader: NSObject {
    
    func getImageFromUrl(url : String , defaultImage : String) -> UIImage {
        
        let imageUrl = NSURL(string: url)
        
        if(NSData(contentsOf: imageUrl! as URL) == nil){
            return UIImage(imageLiteralResourceName: defaultImage)
        }else{
            let imageData = NSData(contentsOf: imageUrl! as URL)
            return UIImage(data: imageData! as Data)!
        }
        
    }

}
