
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.query)
                    .padding()
                List {
                    ForEach(viewModel.items, id: \.title) { item in
                        Text(item.title)
                    }
                }.navigationTitle("Movies list")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
