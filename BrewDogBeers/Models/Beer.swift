//
//  Beer.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Beer

struct Beer: Codable {
    let name: String?
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let ebc: Int?
    let contributed_by: ContributedBy?
    var productDescription: String {
        "Author: \(contributed_by ?? .aliSkinnerAliSkinner). \(description ?? "No description")"
    }
    
//    enum CodingKeys: String, CodingKey {
//        case name
//        case description
//        case imageURL = "image_url"
//        case abv
//        case ibu
//        case ebc
//        case contributedBy = "contributed_by"
//    }
    
    init(name: String, description: String, imageURL: String, abv: Double, ibu: Double, ebc: Int, contirbutedBy: ContributedBy) {
        self.name = name
        self.description = description
        self.image_url = imageURL
        self.abv = abv
        self.ibu = ibu
        self.ebc = ebc
        self.contributed_by = contirbutedBy
    }
    
    init(beerData: [String: Any]) {
        name = beerData["name"] as? String
        description = beerData["description"] as? String
        image_url = beerData["image_url"] as? String
        abv = beerData["abv"] as? Double
                ibu = beerData["ibu"] as? Double
                ebc = beerData["ebc"] as? Int
        contributed_by = beerData["contibuted_by"] as? ContributedBy
        }
    
    static func getBeers(from value: Any) -> [Beer] {
        var beers: [Beer] = []
        guard let beersData = value as? [[String: Any]] else { return [] }
        for beerData in beersData {
            let beer = Beer(beerData: beerData)
            beers.append(beer)
        }
        return beers
    }
}

enum ContributedBy: String, Codable {
    case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
    case samMasonSamjbmason = "Sam Mason <samjbmason>"
    
}
