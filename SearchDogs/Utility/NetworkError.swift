//
//  NetworkError.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation

enum NetworkError: Error {
    case parsinFailed(message:String)
    case errorWith(message:String)
    case networkNotAvailalbe
    case malformedURL(message:String)
}
