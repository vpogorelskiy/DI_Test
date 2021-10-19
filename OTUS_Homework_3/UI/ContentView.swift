
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items, id: \.title) { item in
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
        ContentView().environmentObject(ViewModel())
    }
}
