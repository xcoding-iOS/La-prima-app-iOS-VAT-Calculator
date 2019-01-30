//
//  ViewController
//  VATCalculator
//
//  Created by Giuseppe Sapienza on 28/01/19.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var vatResultView: UIView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var calculatorButton: UIButton!
    
    var priceNumber: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤖", #function)
        self.view.backgroundColor = #colorLiteral(red: 0.965751845, green: 0.965751845, blue: 0.965751845, alpha: 1)
        self.resultLabel.text = "0,00 €"
        self.vatResultView.isHidden = true
        self.calculatorButton.isHidden = true
    }
    
    @IBAction func calculatorButton_touchUpInside(_ sender: UIButton) {
        guard let number = priceNumber else {
            return
        }
        
        let finalPrice = number + (number * 0.22)
        self.resultLabel.text = "\(finalPrice)"
        
        print("🤖 finalPrice:", finalPrice)
        self.vatResultView.isHidden = false
    }
    
    @IBAction func priceTextField_editingChanged(_ sender: UITextField) {
        guard
            let text = sender.text,
            let number = Double.init(text)
        else {
            print("🤖 priceTextField text is not a number")
            self.calculatorButton.isHidden = true
            self.vatResultView.isHidden = true
            return
        }
        
        guard number != 0.0 else {
            print("🤖 priceTextField number is 0.0")
            self.calculatorButton.isHidden = true
            self.vatResultView.isHidden = true
            return
        }
        
        self.calculatorButton.isHidden = false
        self.priceNumber = number
        print("🤖", text)
    }
    
    @IBAction func priceTextField_didEndOnExit(_ sender: UITextField) {
        print("🤖", #function)
    }
    
}
