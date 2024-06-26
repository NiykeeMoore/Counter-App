import Foundation

protocol StoreData {
    var totalCount: Int { get set }
    var textField: String { get set }
    func store(payload data: DataModel)
}
