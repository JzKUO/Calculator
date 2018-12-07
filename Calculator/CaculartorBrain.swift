//
//  CaculartorBrain.swift
//  Calculator
//
//  Created by 郭家政 on 2017/5/3.
//  Copyright © 2017年 郭家政. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double {
	return -operand
}

func multiply(parm1: Double, parm2: Double) -> Double {
	return parm1 * parm1
}

struct CaculartorBrain {

	// 設 accumulator 為 optional 因為一開始沒有任何東西累加
	private var accumulator: Double?

	// 要回傳 Double? 因為一開始 accumulator 是沒有被設定值的
	var result: Double? {
		get {
			return accumulator
		}
	}

	enum Operation {
		case constant(Double)
		case unaryOperation((Double) -> Double)
		case binaryOperation((Double, Double) -> Double)
		case equals
	}

	var operations: Dictionary<String, Operation> = [
		"π": Operation.constant(Double.pi),	// Double.pi
		"e": Operation.constant(M_E),	// M_E
		"√": Operation.unaryOperation(sqrt),
		"cos": Operation.unaryOperation(cos),
		"±": Operation.unaryOperation(changeSign),
		"×": Operation.binaryOperation(multiply),
		"=": Operation.equals
	]

	private struct PendingBinaryOperation {
		<#fields#>
	}

	mutating func performOperation(_ symbol: String) -> Void {
		// 因為有可能在 operations 裡找不到 symbol
		if let operation = operations[symbol] {
			switch operation {
			case .constant(let value):
				accumulator = value
			case .unaryOperation(let function):
				if let accu = accumulator {
					accumulator = function(accu)
				}
			case .binaryOperation(let function):
				break
			case .equals:
				break
			}
		}
	}

	/// 有改變 struct 值的 function 就必須加上 mutating
	mutating func setOperand(_ operand: Double) -> Void {
		accumulator = operand
	}
}










