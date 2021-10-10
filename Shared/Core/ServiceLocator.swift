import Foundation

class ServiceLocator {
    
    static var sharedInstance = ServiceLocator()
    
    private var storedReferences: [String: Any] = .init()
    
    func getInstanceOf<T>(type: T.Type) -> T? {
        let typeName = stringFrom(type: type)
        return storedReferences[typeName] as? T
    }
    
    func saveInstance<T>(_ instance: T) {
        let typeName = stringFrom(type: type(of: instance).self)
        storedReferences[typeName] = instance
    }
    
    private func stringFrom<T>(type: T.Type) -> String {
        return type == Any.self ? "Any" : String(describing: type.self)
    }
}
