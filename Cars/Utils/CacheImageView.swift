//
//  CacheImageView.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class CacheImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    var imageUrl: URL? {
        didSet {
            guard let imageUrl = imageUrl else {
                showFallbackImage()
                return
            }
            
            self.image = nil
            
            if let cachedImage = imageCache.object(forKey: imageUrl.absoluteString as NSString) {
                self.image = cachedImage
            } else {
                
                URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
                    
                    if let data = data, let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: imageUrl.absoluteString as NSString)
                        DispatchQueue.main.async { self.image = image }
                    } else {
                        DispatchQueue.main.async { self.showFallbackImage() }
                    }
                    
                }.resume()
                
            }
            
        }
    }
    
    private func showFallbackImage() {
        self.image = UIImage(named: "fallback")
    }

}
