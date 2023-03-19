//
//  ViewController.swift
//  Home_work_sprint_3_counter
//
//  Created by Dassam on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var logTextView: UITextView!
    
    var counter : Int = 0
   
    let plusLogMessege = " значение изменено на +1"
    let minusLogMessege = " значение изменено на -1"
    let decrisingZeroLogMessege = " попытка уменьшить значение счётчика ниже 0"
    let zeroingLogMessege = " значение сброшено"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController ()
        // Do any additional setup after loading the view.
    }

    func configureViewController() {
            
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        refreshButton.tintColor = .gray
        
        counterLabel.text = String(counter)
        
        logTextView.text = "История изменений:"
        logTextView.layer.borderWidth = 1
        
    }
    
    @IBAction func plusDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        logPrint (plusLogMessege)
    }
    
    @IBAction func minusDidTap(_ sender: Any) {
        
        if counter != 0 {
            counter -= 1
            logPrint (minusLogMessege)
        } else {
            logPrint (decrisingZeroLogMessege)
        }
        counterLabel.text = String(counter)
        
    }
    
    @IBAction func refreshDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = String(counter)
        logPrint (zeroingLogMessege)
    }
    
    func logPrint (_ text: String) {
        let date = Date.now

        let stringDate = date.formatted(date: .numeric, time: .standard)
        
        logTextView.text += "\n" + stringDate + text
        
    }
}

