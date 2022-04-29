//
//  MockService.swift
//  SearchDogsTests
//
//  Created by Rosy Patel on 29/04/2022.
//

import Foundation
@testable import SearchDogs

class MockService: Servicable, JsonDecodable {
    var responseFileName = ""
    func fetchData<T>(networkClient: NetworkClient, type: T.Type, completionHandler: @escaping Completion<T>) where T : Decodable, T : Encodable {
        
        //Obtain Reference to bundle
        let bundle = Bundle(for: MockService.self)
        guard let url = bundle.url(forResource: responseFileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let output = decode(input: data, type: T.self) else {
                  completionHandler(.failure(NetworkError.parsinFailed(message: "Failed to get response")))
                  return
              }
        completionHandler(.success(output))
    }
}
