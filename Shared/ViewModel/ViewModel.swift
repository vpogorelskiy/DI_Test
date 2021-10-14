import Foundation

class ViewModel: ObservableObject {
    @Injected var networkApi: NetworkApi!
    var items: [ViewModelItem] { return networkApi.items }
    
    init() {}
    func reloadData() {
        networkApi.loadData(forQuery: "Contact")
    }
}

protocol NetworkApi {
    var items: [ViewModelItem] { get }
    func loadData(forQuery: String)
}

protocol ViewModelItem {
    var title: String { get }
}
