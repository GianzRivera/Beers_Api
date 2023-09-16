//
//  BeerViewModel.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import Foundation
import SwiftUI

final class BeerViewModel: ObservableObject {

    private let beerManager = BeersManager()

    @Published var searchText = ""
    @Published var beerList = [Beer]()
    @Published var errorMessage = ""
    
    var filteredBeer: [Beer] {
        return searchText == "" ? beerList: beerList.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    var filteredBeerMorethan5: [Beer] {
        return filteredBeer.filter {($0.abv ?? 0.0) >= 5.0 }
    }
    
    var filteredBeerFilterTextCount: Int {
        return filteredBeer.count
    }

    init() {
        //self.beerList = beerManager.getBeers()
        self.onLoadView()
    }

    func onLoadView() {
        beerManager.fetchAllBeers({ response in
            self.errorMessage = ""
            self.beerList = response
        }, { error in
            self.errorMessage = error.localizedDescription
        })
    }
    
    func loadDefultInformation() {
        self.beerList = beerManager.getMockBeers()
    }
    
    func getBeerIndex(beer: Beer) -> Int {
        if let index = self.beerList.firstIndex(of: beer) {
            return index + 1
        }
        return 0
    }

}
