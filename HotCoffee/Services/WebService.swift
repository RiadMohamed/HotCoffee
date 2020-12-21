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

struct Resource<T: Codable> {
    let url: URL
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
