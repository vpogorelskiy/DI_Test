
protocol NetworkApi {
    func loadData(forQuery: String, completion: @escaping ([NetworkApiResponse], Error?) -> Void)
}

protocol NetworkApiResponse {
    var title: String? { get }
}

