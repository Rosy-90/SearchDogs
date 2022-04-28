//
//  EndPoints.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation

enum  EndPoints: String {
    case baseUrl = "https://api.thedogapi.com/"
    case imageBaseurl = "https://cdn2.thedogapi.com/images/"
}

enum Path: String {
    case breedsSearch = "v1/breeds/search"
}
