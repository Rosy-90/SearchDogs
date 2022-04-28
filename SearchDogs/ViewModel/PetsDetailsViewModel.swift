//
//  PetsDetailsViewModel.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation

protocol PetDetailsViewModelProtocal {
    var breadName: String {get}
    var height: String {get}
    var weight: String {get}
    var lifeSpan: String {get}
    var temperament: String {get}
}
class PetDetailsViewModel: PetDetailsViewModelProtocal {
    var height: String
    var weight: String
    var lifeSpan: String
    var temperament: String
    var breadName: String
    
    init(petDetails:(breadName: String,
                     height: String,
                     weight: String,
                     lifeSpan: String,
                     temperament: String)) {
        self.breadName = petDetails.breadName
        self.height = petDetails.height
        self.weight = petDetails.weight
        self.lifeSpan = petDetails.lifeSpan
        self.temperament = petDetails.temperament
    }
}
