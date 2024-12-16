import UIKit

class ViewController: UIViewController {
    //MARK: @IBOutlet's
    @IBOutlet weak private var labelCounter: UILabel!
    @IBOutlet weak private var buttonReset: UIButton!
    @IBOutlet weak private var buttonPlus: UIButton!
    @IBOutlet weak private var buttonMinus: UIButton!
    @IBOutlet weak private var textViewChangeHistory: UITextView!
    @IBOutlet weak var deleteData: UIButton!
    
    //MARK: Params
    private let counterImpl = CounterImpl()
    
    //MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateView()
    }
    
    //MARK: Private Funcs
    private func setupView() {
        buttonPlus.tintColor = .red
        buttonPlus.setTitle(ButtonName.increment.rawValue, for: .normal)
        
        buttonMinus.tintColor = .blue
        buttonMinus.setTitle(ButtonName.decrement.rawValue, for: .normal)
        
        buttonReset.tintColor = .darkGray
        buttonReset.setTitle(ButtonName.resetData.rawValue, for: .normal)
        
        textViewChangeHistory.backgroundColor = .systemGray6
    }
    
    private func updateView() {
        textViewChangeHistory.text = counterImpl.updateTextViewHistory()
        labelCounter.text = "\(counterImpl.statisticService.totalCounterScore)"
    }
    //MARK: @IBAction's
    @IBAction private func buttonPressed(_ sender: UIButton) {
        guard let buttonName = sender.titleLabel?.text else { return }
        counterImpl.updateCounterLabel(buttonName)
        updateView()
    }
    @IBAction func deleteData(_ sender: Any) {
        counterImpl.statisticService.clearData()
        updateView()
    }
}
