//
//  ContentView.swift
//  Shared
//
//  Created by Вячеслав Погорельский on 07.10.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.title) { item in
                Text(item.title)
            }
        }.onAppear {
            viewModel.reloadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView()
    }
}
