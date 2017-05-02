//
//  ViewController.swift
//  Calculator
//
//  Created by 郭家政 on 2017/5/3.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var display: UILabel!

	var userIsInTheMiddleOfTyping = false

	var displayValue: Double {
		get {
			return Double(display.text!)!
		}
		set {
			display.text = String(newValue)
		}
	}


	@IBAction func touchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTyping {
			display.text = display.text! + digit
		} else {
			display.text = digit
			userIsInTheMiddleOfTyping = true
		}
	}

	@IBAction func performOperation(_ sender: UIButton) {
		userIsInTheMiddleOfTyping = false

		if let mathSymbol = sender.currentTitle {
			switch mathSymbol {
			case "π":
				displayValue = Double.pi
			case "√":
				displayValue = sqrt(displayValue)
			default:
				break
			}
		}
	}
	
}

