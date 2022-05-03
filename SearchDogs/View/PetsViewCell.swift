//
//  PetsViewCell.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import UIKit

class PetsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var breedName: UILabel!
    
    func setData(petDetails:(imageName: String, breadName: String)) {
        breedName.text = petDetails.breadName
        setPetImage(imageName: petDetails.imageName)
    }
    func setPetImage(imageName: String) {
        let url = URL(string: imageName)
        downloadDogsImagesForSearchResult(imageURL: url)
        
    }
    
    func downloadDogsImagesForSearchResult(imageURL: URL?) {
        let imageCache = NSCache<AnyObject, AnyObject>.sharedInstance
        let downloadTask: URLSessionDownloadTask?
        
        if let urlOfImage = imageURL {
            if let cachedImage = imageCache.object(forKey: urlOfImage.absoluteString as NSString) {
                self.petImageView.image = cachedImage as? UIImage
            } else {
                let session = URLSession.shared
                downloadTask = session.downloadTask(
                    with: urlOfImage as URL, completionHandler: { [weak self] url, response, error in
                        if error == nil, let url = url, let data = NSData(contentsOf: url), let image = UIImage(data: data as Data) {
                            
                            DispatchQueue.main.async() {
                                let imageToCache = image
                                if let self = self, let imageView = self.petImageView {
                                    imageView.image = imageToCache
                                    imageCache.setObject(imageToCache, forKey: urlOfImage.absoluteString as NSString , cost: 1)
                                }
                            }
                        } else {
                            print("ERROR \(String(describing: error?.localizedDescription))")
                        }
                    })
                downloadTask!.resume()
            }
        }
    }
}

extension NSCache {
    @objc class var sharedInstance: NSCache<NSString, AnyObject> {
        let cache = NSCache<NSString, AnyObject>()
        return cache
    }
}
