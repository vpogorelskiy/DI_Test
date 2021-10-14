import MoviesApi
import XCTest

extension MoviesAPI: NetworkApi {
    var items: [ViewModelItem] {
        return movies.map{ ApiItem(title: $0.title ?? "") }
    }
    
    func loadData(forQuery: String) {
        makeSearch(query: forQuery,
                   batchSize: 20,
                   startIndex: 1) { [weak self] result, error in
            self?.movies = result
        }
    }
}

struct ApiItem: ViewModelItem {
    let title: String
}

