import Foundation

protocol StatisticService {
    var totalCounterScore: Int { get set }
    var allHistoryText: String { get set }
    func clearData()
}
