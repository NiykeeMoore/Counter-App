import Foundation

final class CounterImpl {
    
    //MARK: - Params
    let statisticService: StatisticServiceImpl
    
    //MARK: - INIt
    init(statisticService: StatisticServiceImpl = StatisticServiceImpl()) {
        self.statisticService = statisticService
    }
    
    //MARK: - Public Funcs
    func updateCounterLabel(_ button: String) {
        switch button {
        case ButtonName.increment.rawValue:
            increment()
        case ButtonName.decrement.rawValue:
            decrement()
        case ButtonName.resetData.rawValue:
            reset()
        default:
            break
        }
    }
    
    func updateTextViewHistory() -> String  {
        return statisticService.allHistoryText
    }
    
    //MARK: - Private Funcs
    
    private func increment() {
        sendMessage(text: "Значение изменено на +1")
        statisticService.totalCounterScore += 1
    }
    
    private func decrement() {
        if statisticService.totalCounterScore > 0 {
            sendMessage(text: "Значение изменено на -1")
            statisticService.totalCounterScore -= 1
        } else {
            sendMessage(text: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    private func reset() {
        sendMessage(text: "Значение сброшено")
        statisticService.totalCounterScore = 0
    }
    
    private func sendMessage(text: String) {
        statisticService.allHistoryText += "\n [\(viewDateTime())]: \(text)"
    }
    
    private func viewDateTime() -> String {
        return Date().dateTimeString
    }
}
