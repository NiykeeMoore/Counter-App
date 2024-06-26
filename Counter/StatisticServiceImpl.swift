import Foundation

final class StatisticServiceImpl {
    private let userDefaults: UserDefaults = .standard
    
    private enum Keys: String {
        case totalScore
        case historyText
    }
    
    var totalCounterScore: Int {
        get {
            userDefaults.integer(forKey: Keys.totalScore.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.totalScore.rawValue)
        }
    }
    var allHistoryText: String {
        get {
            userDefaults.string(forKey: Keys.historyText.rawValue) ?? "История пуста"
        }
        set {
            userDefaults.set(newValue, forKey: Keys.historyText.rawValue)
        }
    }
    
    func clearData() {
        userDefaults.removeObject(forKey: Keys.historyText.rawValue)
        userDefaults.removeObject(forKey: Keys.totalScore.rawValue)
    }
}
