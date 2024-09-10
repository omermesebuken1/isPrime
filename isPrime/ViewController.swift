//
//  ViewController.swift
//  isPrime
//
//  Created by Ömer Meşebüken on 3.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primeText: UILabel!
    
    @IBOutlet weak var numText: UILabel!
    
    @IBOutlet weak var divers: UILabel!
    
    var theNum:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        theNum = ""
        primeText.text = ""
        numText.text = ""
        divers.text = ""
        
    }
    
    func addToNumber(value: String) {
        if theNum.count < 10 {
            theNum = theNum + value
            updateNumText()
            calculate()
        }
    }
    
    func updateNumText() {
        var formattedNum = ""
        let numLength = theNum.count
        
        // Determine the starting index for the first dot
        let startIndex = numLength % 3 == 0 ? 3 : numLength % 3
        
        // Add dots every three digits
        for (index, digit) in theNum.enumerated() {
            formattedNum.append(digit)
            if (index + 1) == startIndex && numLength > 3 {
                formattedNum.append(".")
            } else if (index + 1 - startIndex) % 3 == 0 && (index + 1) != numLength {
                formattedNum.append(".")
            }
        }
        
        numText.text = formattedNum
    }

    
    func calculate() {
        if !theNum.isEmpty {
            guard let intValue = Int(theNum) else {
                print("Invalid input: Not a valid integer.")
                return
            }
            isPrime(intValue)
            
        }
    }
    
    func isPrime(_ number: Int) {
        
        primeText.text = ""
        
        guard number >= 2 else {
            primeText.text = "is not prime"
            divers.text = "<3"
            primeText.textColor = UIColor.darkGray
            return
        }
        
        let squareRoot = Int(Double(number).squareRoot())
        guard squareRoot >= 2 else {
            divers.text = ""
            primeText.text = "is prime"
            primeText.textColor = UIColor.systemOrange
            return
        }
        
        for i in 2...squareRoot {
            if number % i == 0 {
                var diver: Int
                diver = number / i
                divers.text = "\(i) x \(diver)"
                primeText.text = "is not prime"
                primeText.textColor = UIColor.darkGray
                return
            }
        }
        
        divers.text = ""
        primeText.text = "is prime"
        primeText.textColor = UIColor.systemOrange
    }


    @IBAction func backTap(_ sender: Any) {
        if(!theNum.isEmpty)
        {
            theNum.removeLast()
            numText.text = theNum
            if(!theNum.isEmpty)
            {
                updateNumText()
                calculate()
            }
            else
            {
                divers.text = ""
                primeText.text = ""
            }
        }
    }
    
    @IBAction func zeroTap(_ sender: Any) {
        if(!theNum.isEmpty)
        {
            addToNumber(value: "0")
        }
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToNumber(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToNumber(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToNumber(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToNumber(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToNumber(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToNumber(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToNumber(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToNumber(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any) {
        addToNumber(value: "9")
    }
    
    
}

