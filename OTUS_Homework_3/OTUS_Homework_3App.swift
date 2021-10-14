import SwiftUI
import MoviesApi

@main
struct OTUS_Homework_3App: App {
    
    init() {
        Resolver.sharedInstance.register(NetworkApi.self) { r in
            MoviesAPI()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MovieViewModel())
        }
    }
}
