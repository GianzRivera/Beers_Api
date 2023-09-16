//
//  BeerDetailView.swift
//  Beers
//
//  Created by Gian Rivera on 16/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = BeerViewModel()
    @State private var showMoreThan5 = false
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                        Toggle(isOn: $showMoreThan5, label: {
                           Text("Show More than $ 5 price")
                        }).padding(.leading, 25)
                            .padding(.trailing, 25)
                            .padding(.bottom, 12)
                            .isHidden(vm.filteredBeerFilterTextCount == 0)
                        HStack {
                            Text("Not Results found")
                                .font(.system(size: 14, weight: .light, design: .monospaced))
                                .padding(25)
                                .padding(50)
                                .isHidden(vm.filteredBeerFilterTextCount != 0, remove: vm.filteredBeerFilterTextCount != 0 )
                        }
                        List{
                            ForEach(showMoreThan5 == true ? vm.filteredBeerMorethan5 : vm.filteredBeer) { beer in
                                NavigationLink(destination: BeerDetailView(beer: beer)) {
                                    BeerView(beer: beer)
                                }
                            }
                        }
                        .animation(.easeOut(duration:0.4), value: vm.filteredBeer.count)
                        .navigationTitle("Beers Market")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .searchable(text: $vm.searchText)
            .environmentObject(vm)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
