import Foundation

class ViewModel: ObservableObject {
    @Injected var networkApi: NetworkApi!
    
    func reloadData() {
        networkApi.loadData(forQuery: "Movie")
    }
}

protocol NetworkApi {
    var items: [ViewModelItem] { get }
    func loadData(forQuery: String)
}

protocol ViewModelItem {
    var title: String { get }
}
