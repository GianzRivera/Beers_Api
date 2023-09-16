//
//  BeersModel.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import Foundation

// MARK: - Beer
struct Beer: Codable, Identifiable, Equatable {
    
    let id: Int
    let name: String
    let imageURL: String?
    let description: String
    let abv: Double?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name
        case description
        case imageURL = "image_url"
        case abv
    }
    
    static var sampleBeer = Beer(
        id: 0,
        name: "Pilsen",
        imageURL: "https://images.punkapi.com/v2/2.png",
        description: "Running the knife-edge between an India Pale Ale and a Stout, this particular style is one we truly love. Black IPAs are a great showcase for the skill of our brew team, balancing so many complex and twisting flavours in the same moment. The citrus, mango and pine from the hops – three of our all-time favourites – play off against the roasty dryness from the malt bill at each and every turn.",
        abv: 4.0
    )
    
}
