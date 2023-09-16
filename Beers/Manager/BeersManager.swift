//
//  BeersManager.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import Foundation

class BeersManager {

    private let kBeersApiURL = "https://api.punkapi.com/v2/beers"
    
    func getMockBeers() -> [Beer] {
        let data: [Beer] = Bundle.main.decode(file: "beers.json")
        print("getBeers\(data)")
        return data
    }
    
    func fetchAllBeers(
        _ completion: @escaping ([Beer]) -> (),
        _ onError: @escaping (Error) -> ()
    ) {
        Bundle.main.fetchData(url: kBeersApiURL, model: [Beer].self) { data in
            DispatchQueue.main.async {
                completion(data)
            }
        } failure: { error in
            DispatchQueue.main.async {
                onError(error)
            }
            print(error)
        }
    }

}
