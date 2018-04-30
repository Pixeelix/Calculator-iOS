//
//  ViewController.swift
//  MP_Calculator
//
//  Created by Greete Jõgi on 27/04/2018.
//  Copyright © 2018 Martin Pihooja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var prevousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var outputLbl: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        
        if performingMath == true
        {
            outputLbl.text = String(sender.tag-1)
            numberOnScreen = Double(outputLbl.text!)!
            performingMath = false
        }
        else
        {
            outputLbl.text = outputLbl.text! + String(sender.tag-1)
            numberOnScreen = Double(outputLbl.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if outputLbl.text != "" && sender.tag != 11 && sender.tag != 18
        {
            prevousNumber = Double(outputLbl.text!)!
            
            //Divide button
            if sender.tag == 14
            {
                outputLbl.text = "/";
            }
            //Multiply button
            else if sender.tag == 15
            {
                outputLbl.text = "x";
            }
            //Minus button
            else if sender.tag == 16
            {
                outputLbl.text = "-";
            }
            //Plus button
            else if sender.tag == 17
            {
                outputLbl.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 18
        {
            if operation == 14
            {
                outputLbl.text = String(prevousNumber / numberOnScreen)
            }
            else if operation == 15
            {
                outputLbl.text = String(prevousNumber * numberOnScreen)
            }
            else if operation == 16
            {
                outputLbl.text = String(prevousNumber - numberOnScreen)
            }
            else if operation == 17
            {
                outputLbl.text = String(prevousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            outputLbl.text = ""
            prevousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

