import Foundation
import Combine

class ViewModel: ObservableObject {
    @Injected private var networkApi: NetworkApi!
    @Published var items: [ViewModelItem] = [ViewModelItem(title: "No results")]
    @Published var query: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $query
            .debounce(for: .seconds(1),
                         scheduler: DispatchQueue.main)
            .sink { [weak self] q in
                self?.networkApi.loadData(forQuery: q) { [weak self] response, error in
                    self?.items = response.map{ ViewModelItem(title: $0.title ?? "") }
                }
            }
            .store(in: &subscriptions)
    }
}

struct ViewModelItem {
    var title: String
}


