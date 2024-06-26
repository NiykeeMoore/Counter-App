import Foundation

class CounterEditorImpl: CounterEditor {
    func incrementScore(value score: Int) -> Int {
        return score + 1
    }
    
    func decrementScore(value score: Int) -> Int {
        return score <= 0 ? 0 : score - 1
    }
    
    func resetscore(value score: Int) -> Int {
        return 0
    }
}
