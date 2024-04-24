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
    
    private func viewDateTime() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH: mm"
        dateFormatter.timeZone = TimeZone.current
        let informationDateTime = dateFormatter.string (from: Date())
        return informationDateTime
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
    private func textViewUpdate(_ sender: UIButton) {
        switch sender {
        case buttonPlus:
            textViewChangeHistory.text += "\n [\(viewDateTime())]: значение изменено на +1"
        case buttonMinus:
            textViewChangeHistory.text += "\n [\(viewDateTime())]: значение изменено на -1"
        case buttonReset:
            textViewChangeHistory.text += "\n [\(viewDateTime())]: значение сброшено"
        default:
            break
        }
    }
    
    @IBAction func buttonPlusPressed(_ sender: Any) {
        numberOfClicks += 1
        textViewUpdate(buttonPlus)
    }
    
    @IBAction func buttonMinusPressed(_ sender: Any) {
        if numberOfClicks != 0 {
            numberOfClicks -= 1
            textViewUpdate(buttonMinus)
        } else {
            textViewChangeHistory.text += "\n [\(viewDateTime())]: попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction func buttonResetPressed(_ sender: Any) {
        numberOfClicks = 0
        textViewUpdate(buttonReset)
    }
}

