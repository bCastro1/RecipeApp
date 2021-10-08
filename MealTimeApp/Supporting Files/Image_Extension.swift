//
//  UIImageView_Extension.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

//downloading images from url and caching them

var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageWithURL(_ url: String?) {
        let errorImage = UIImage(systemName: "exclamationmark.icloud.fill")
        let placeholderImage = UIImage(systemName: "photo")
        
        guard let urlString = url else {
            self.image = errorImage
            return
        }
        
        // check cache for image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }

        guard let url = URL(string: urlString) else {
            return
        }
        
        //setting a placeholder image while loading
        self.image = placeholderImage
        
        //start network call
        self.fetchImageFromNetwork(url: url)
    }
    
    private func fetchImageFromNetwork(url: URL) {
        let errorImage = UIImage(systemName: "exclamationmark.icloud.fill")
        
        // starting network fetch
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error ) in
            
            //fails with nserror, set image accordingly
            if let _ = error {
                DispatchQueue.main.async {
                    self?.image = errorImage
                }
                return
            }
            
            //server response failed.
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            if !(200...299).contains(statusCode) {
                DispatchQueue.main.async {
                    self?.image = errorImage
                }
                return
            }
            
            //everything completes as expected, set image
            if let self = self, let data = data, let image = UIImage(data: data) {
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
