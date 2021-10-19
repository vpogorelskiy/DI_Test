import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Injected private var networkApi: NetworkApi!
    @Published var items: [ViewModelItem] = []
    
    func reloadData() {
        networkApi.loadData(forQuery: "Movie") { [weak self] response, error in
            self?.items = response.map{ ViewModelItem(title: $0.title ?? "") }
        }
    }
}

struct ViewModelItem {
    var title: String
}


