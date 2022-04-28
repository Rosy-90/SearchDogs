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
    
    func setData(petDetails:(imageName:String, breadName:String)) {
        breedName.text = petDetails.breadName
        setPetImage(imageName:petDetails.imageName)
    }
    func setPetImage(imageName:String) {
        let url = URL(string: imageName)
    }
}
