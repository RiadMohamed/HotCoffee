//
//  WebService.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 12/21/20.
//

import Foundation

enum NetworkError: Error {
    case JSONParingError
    case urlParsingError
    case networkingError
}

enum HTTP: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    var url: URL
    var http: HTTP = .get
    var body: Data? = nil
}


class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void ) {
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            
            guard let safeData = data else {
                completion(.failure(.networkingError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: safeData)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                
            } catch  {
                completion(.failure(.JSONParingError))
            }
        }.resume()
    }
}
