//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 07.10.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.networkApi.items, id: \.title) { item in
                    Text(item.title)
                }
            }.onAppear {
                viewModel.reloadData()
            }.navigationTitle("Movies list")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView().environmentObject(MovieViewModel())
    }
}
