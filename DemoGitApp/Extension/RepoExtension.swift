//
//  RepoExtension.swift
//  DemoGitApp
//
//  Created by Pallavi Agarwal on 23/07/21.
//  Copyright © 2021 Demo. All rights reserved.
//

import Foundation
import UIKit

var imageChache = NSCache<AnyObject,AnyObject>()

extension UIImageView {
    
    func load(urlString : String) {
       
        if let image = imageChache.object(forKey: urlString as NSString) as? UIImage
        {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageChache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
