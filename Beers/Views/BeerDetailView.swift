//
//  BeerDetailView.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import SwiftUI

struct BeerDetailView: View {
    
    @EnvironmentObject var vm: BeerViewModel
    let beer: Beer
    let dimensions: Double = 240
    
    var body: some View {
        VStack(alignment: .center) {
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
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
            VStack(alignment: .leading) {
                Text("\(beer.name.capitalized)").padding(.top, 20)
                    .font(.system(size: 16.5, weight: .light, design: .monospaced))
                Text("\(beer.description)").padding(.top, 4)
                    .font(.system(size: 15, weight: .light, design: .rounded))
                Text("$ \((beer.abv ?? 0.0), specifier: "%.2f")")
                    .padding(.top, 4)
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .padding(.top, 25)
        }
        Spacer()
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        BeerDetailView(beer: Beer.sampleBeer)
            .environmentObject(BeerViewModel())
    }
    
}
