//
//  calcViewController.swift
//  calculator
//
//  Created by Kevin Brennan on 7/26/17.
//  Copyright © 2017 Kevin Brennan. All rights reserved.
//

import UIKit

class calcViewController: UIViewController {

    var period = false
    var pick: Int = 1
    var newNumber: String?
    var currentNumber: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
     //   label.text = label.text! + String(sender.tag-1)
        newNumber = currentNumber + String(sender.tag-1)
        currentNumber = newNumber!
        label.text = newNumber! + " " + inputUnit[pick - 1]
        
        switch pick {
            
        case 1:
            Output.text = fahrenheitToCelcius(currentNumber)
        case 2:
            Output.text = celciusToFahrenheit(currentNumber)
        case 3:
            Output.text = milesToKilometers(currentNumber)
        case 4:
            Output.text = kiloToMiles(currentNumber)
        default:
            Output.text = fahrenheitToCelcius(currentNumber)
        }
        
            
    }
    


        

    @IBAction func buttons(_ sender: UIButton) {
        let check = Double(currentNumber)!
        
        if sender.tag == 11
        {
            self.currentNumber = ""
            self.label.text = ""
            period = false
            Output.text = ""
        }
        if sender.tag == 12
        {
            if check > 0
            {
                currentNumber = "-" + currentNumber
                label.text = "-" + label.text!

            }
            if check < 0
            {
                currentNumber = String(abs(check))
                label.text = String(abs(check)) + " " + inputUnit[pick - 1]

            }
        }
        if sender.tag == 13 && period == false
        {
            currentNumber = currentNumber + "."
            label.text = currentNumber + inputUnit[pick - 1]
            period = true
        }
        
        
        
    }

    var inputUnit = ["\u{00B0}F","\u{00B0}C","mi","km"]
    var outputUnit = ["\u{00B0}C","\u{00B0}F","km","mi"]
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var Output: UITextField!
    
    

    
    func milesToKilometers(_ mile: String) -> String {
        let number: Double = Double(mile)!
        let multiply: Double = 1.61
        return String(format: "%.2f", number * multiply) + " " + "km"
    }
    func kiloToMiles(_ kilo: String) -> String {
        let number: Double = Double(kilo)!
        let divide: Double = 1.61
        return String(format: "%.2f", number / divide) + " " + "mi"
    }
    func fahrenheitToCelcius(_ fahrenheit: String) -> String {
        let number: Double = Double(fahrenheit)!
        let convert: Double = 5/9
        return String(format: "%.2f", (number - 32) * convert) + " " + "\u{00B0}C"
    }
    func celciusToFahrenheit(_ celcius: String) -> String {
        let number: Double = Double(celcius)!
        let convert: Double = 9/5
        return String(format: "%.2f", (number * convert) + 32) + " " + "\u{00B0}F"
    }
    
    

    
    @IBAction func convertbutton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.pick = 1
            self.currentNumber = ""
            self.label.text = ""
            self.period = false
            self.Output.text = ""
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.pick = 2
           self.label.text = ""
            self.currentNumber = ""
            self.period = false
            self.Output.text = ""
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.pick = 3
           self.label.text = ""
            self.currentNumber = ""
            self.period = false
            self.Output.text = ""
            
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.pick = 4
           self.label.text = ""
            self.currentNumber = ""
            self.period = false
            self.Output.text = ""
        }))
        

        self.present(alert, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    


}
