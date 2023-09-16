//
//  BeerView.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import SwiftUI

struct BeerView: View {
   
    @EnvironmentObject var vm: BeerViewModel
    let beer: Beer
    let dimensions: Double = 60
    let colors: [String: Color] = ["n": .yellow]
    
    var body: some View {
        HStack(alignment: .center) {
            if vm.errorMessage.isEmpty {
                AsyncImage(url: URL(string: "\(beer.imageURL ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                }
                .background(.ultraThickMaterial)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(.cyan, lineWidth: 1))
                VStack(alignment: .leading) {
                    Text("\(beer.name.capitalized)")
                        .font(.system(size: 14, weight: .light, design: .monospaced))
                    Text("$ \((beer.abv ?? 0.0), specifier: "%.2f")")
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                }
            } else {
                Text("\(vm.errorMessage)")
                    .font(.system(size: 14, weight: .light, design: .monospaced))
                    .padding(25)
            }
           
        }
    }

}

struct BeerView_Previews: PreviewProvider {
    
    static var previews: some View {
        BeerView(beer: Beer.sampleBeer)
            .environmentObject(BeerViewModel())
    }
    
}
