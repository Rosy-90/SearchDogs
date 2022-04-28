//
//  Service.swift
//  SearchDogs
//
//  Created by Rosy Patel on 28/04/2022.
//

import Foundation

protocol Servicable: JsonDecodable {
    func fetchData<T: Codable>(networkClient: NetworkClient, type: T.Type, completionHandler: @escaping Completion<T>)
}

typealias Completion<T:Decodable> =  ((Result<[T], NetworkError>) -> Void)

/*Created Class to inject as dependency in veiwModel and use MockService for Unit testing*/

class Service: Servicable {
    let urlSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    func fetchData<T>(networkClient: NetworkClient, type: T.Type, completionHandler: @escaping Completion<T>) where T : Decodable, T : Encodable {
        dataTask?.cancel()
        guard var urlComponents = URLComponents(string: networkClient.baseURL + networkClient.path) else {
            completionHandler(.failure(.malformedURL(message: Constants.urlNotCorrect)))
            return
        }
        print(urlComponents)
        urlComponents.query = "\(networkClient.params)"
        
        guard let url = urlComponents.url else {
            completionHandler(.failure(.malformedURL(message: Constants.urlNotCorrect)))
            return
        }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = networkClient.method
        
        urlRequest.allHTTPHeaderFields = ["x-api-key":Constants.apiKey]
        
        dataTask = urlSession.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.errorWith(message: Constants.noResponse)))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.errorWith(message: Constants.noData)))
                return
            }
            
            if let result = self?.decode(input: data, type: type) {
                completionHandler(.success(result))
            } else {
                completionHandler(.failure(.parsinFailed(message: Constants.parsingFailed)))
            }
        }
        dataTask?.resume()
    }
}
