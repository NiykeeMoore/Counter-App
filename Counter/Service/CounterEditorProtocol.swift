import Foundation

protocol CounterEditor {
    func incrementScore(value score: Int) -> Int
    func decrementScore(value score: Int) -> Int
    func resetscore(value score: Int) -> Int
}
