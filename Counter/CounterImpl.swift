import Foundation

final class CounterImpl {
    //MARK: Params
    let statisticService: StatisticServiceImpl
    
    //MARK: INIt
    init(statisticService: StatisticServiceImpl = StatisticServiceImpl()) {
        self.statisticService = statisticService
    }
    
    //MARK: Public Funcs
    func updateCounterLabel(_ button: String) {
        switch button {
        case "+":
            increment()
            sendMessage(text: "Значение изменено на +1")
        case "-":
            decrement()
            sendMessage(text: "Значение изменено на -1")
        case "🔄":
            reset()
            sendMessage(text: "Значение сброшено")
        default:
            break
        }
    }
    
    //MARK: Private Funcs
    func updateTextViewHistory() -> String  {
        return statisticService.allHistoryText
    }
    
    private func increment() {
        return statisticService.totalCounterScore += 1
    }
    
    private func decrement() {
        if statisticService.totalCounterScore > 0 {
            statisticService.totalCounterScore -= 1
        } else {
            return sendMessage(text: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    private func reset() {
        return statisticService.totalCounterScore = 0
    }
    
    private func sendMessage(text: String) {
        return statisticService.allHistoryText += "\n [\(viewDateTime())]: \(text)"
    }
    
    private func viewDateTime() -> String {
        return Date().dateTimeString
    }
}
