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
    
    func fetchImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    func alamofireRequest(from url: String, completion: @escaping (Result<[Beer], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    completion(.success(Beer.getBeers(from: value)))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
