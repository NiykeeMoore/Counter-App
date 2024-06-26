import Foundation

final class StoreDataImpl: StoreData {
    var totalCount: Int = 0
    
    
    private let userDefaults: UserDefaults = .standard
    
    private enum Keys: String {
        case totalScore
        case textField
        case counterData
    }
    
    var totalScore: Int {
        get {
            return userDefaults.integer(forKey: Keys.totalScore.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.totalScore.rawValue)
        }
    }
    
    var textField: String {
        get {
            return userDefaults.string(forKey: Keys.textField.rawValue) ?? "Пусто"
        }
        set {
            userDefaults.set(newValue, forKey: Keys.textField.rawValue)
        }
    }
    
    func store(payload data: DataModel) {
        userDefaults.data
    }
    
}
