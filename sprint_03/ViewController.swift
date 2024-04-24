//
//  ViewController.swift
//  sprint_03
//
//  Created by Владимир Головин on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCounter: UILabel!
    
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var textViewChangeHistory: UITextView!
    
    // Переменная колличества нажатий
    var numberOfClicks: Int = 0 {
        didSet {
            updateCountLabel()
        }
    }
    /*
     Устанавливаем дефолтные:
     - текст лэйбла
     - цвета кнопок
     - значок на кнопке
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelCounter.text = "Значение счетчика: 0"
        buttonPlus.tintColor = .red
        buttonMinus.tintColor = .blue
        buttonReset.tintColor = .darkGray
        buttonReset.setTitle("🔄", for: .normal)
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter
    }()
    
    private func viewDateTime() -> String {
        return dateFormatter.string(from: Date())
    }
    
    /*
     Обновление лэйбла количества нажатий
     */
    private func updateCountLabel() {
        labelCounter.text = "Значение счетчика: \(numberOfClicks)"
    }
    
    /*
     Обновление текстового поля с историей изменений.
     Принимаем кнопку, перебираем имя кнопки и в зависимости от названия выводим строку
     */
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        var changeText: String = ""
        
        switch sender {
        case buttonPlus:
            numberOfClicks += 1
            changeText = "значение изменено на +1"
            
        case buttonMinus:
            if numberOfClicks > 0 {
                numberOfClicks -= 1
                changeText = "значение изменено на -1"
            } else {
                changeText = "попытка уменьшить значение счетчика ниже 0"
            }
            
        case buttonReset:
            numberOfClicks = 0
            changeText = "значение сброшено"
        default:
            break
        }
        textViewChangeHistory.text += "\n [\(viewDateTime())]: \(changeText)"
    }
}
