//
//  NetworkManager.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.
//

import Alamofire
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let apiURL = "https://api.punkapi.com/v2/beers"
    
    private init() {}
    
    func alamofireRequest(from url: String, completion: @escaping (Result<[Beer], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    completion(.success(Beer.getBeers(from: value)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImageWithAF(from url: String, completion: @escaping (Data) -> Void) {
        AF.request(url)
            .validate()
            .responseData { responseData in
                guard let data = responseData.data else {
                    print(responseData.error?.localizedDescription ?? "No errors")
                    return
                }
                completion(data)
            }
    }
    
}
