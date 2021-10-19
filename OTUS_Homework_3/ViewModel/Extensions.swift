import MoviesApi

extension MoviesAPI: NetworkApi {
    func loadData(forQuery: String, completion: @escaping ([NetworkApiResponse], Error?) -> Void) {
        makeSearch(query: forQuery,
                   batchSize: 20,
                   startIndex: 1) { [weak self] result, error in
            self?.movies = result
            completion(result, error)
        }
    }
}

extension MovieShort: NetworkApiResponse {}
