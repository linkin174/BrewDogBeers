//
//  Beer.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.

import Foundation

struct Beer: Codable {
    let name: String?
    let description: String?
    let imageURL: String?
    let abv: Double?
    let ibu: Double?
    let ebc: Int?
    let contributedBy: ContributedBy?
    var characteristics: String? {
        """
        ABV = \(String(format: "%.2f", abv ?? 0.0))
        IBU = \(String(format: "%.2f", ibu ?? 0.0))
        EBC = \(String(ebc ?? 0))
        """
    }

    enum CodingKeys: String, CodingKey {
        case name
        case description
        case imageURL = "image_url"
        case abv
        case ibu
        case ebc
        case contributedBy = "contributed_by"
    }
    
    
    enum ContributedBy: String, Codable {
        case aliSkinnerAliSkinner = "Ali Skinner <AliSkinner>"
        case samMasonSamjbmason = "Sam Mason <samjbmason>"
    }

//Оставил на будущее
/*
    init(name: String, description: String, imageURL: String, abv: Double, ibu: Double, ebc: Int, contirbutedBy: ContributedBy) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
        self.ebc = ebc
        contributedBy = contirbutedBy.rawValue
    }
*/
    init(beerData: [String: Any]) {
        name = beerData["name"] as? String
        description = beerData["description"] as? String
        imageURL = beerData["image_url"] as? String
        abv = beerData["abv"] as? Double
        ibu = beerData["ibu"] as? Double
        ebc = beerData["ebc"] as? Int
        contributedBy = beerData["contributed_by"] as? ContributedBy
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

