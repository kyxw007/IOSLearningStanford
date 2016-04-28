//
//  CalculatorModel.swift
//  NewCaculator
//
//  Created by WangBen on 16/4/20.
//  Copyright © 2016年 WangBen. All rights reserved.
//

import Foundation

class CalculatorModel{
    private enum Op: CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String,Double -> Double)
        case BinaryOperation(String,(Double,Double) -> Double)
        var description:String{
            get{
                switch self {
                case .Operand(let operand):
                    return String(operand)
                case .UnaryOperation(let operation, _ ):
                    return operation
                case .BinaryOperation(let operation, _ ):
                    return operation
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init() {
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["−"] = Op.BinaryOperation("−") { $1 - $0 }
        knownOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate1( ops: [Op]) -> (result: Double?,remainingOps: [Op])
    {
        if !ops.isEmpty{
            var remainOps = ops
            let op = remainOps.removeLast()
            
            switch op {
            case .Operand(let operand):
                return (operand,remainOps)
            case .UnaryOperation(_, let operation):
                let remainOperationEvaluation = evaluate1(remainOps)
                if let oprand = remainOperationEvaluation.result {
                    return (operation(oprand),remainOperationEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let remainOperationEvaluation = evaluate1(remainOps)
                if let oprand1 = remainOperationEvaluation.result {
                    let remainOperationEvaluation2 = evaluate1(remainOperationEvaluation.remainingOps)
                    if let oprand2 = remainOperationEvaluation2.result{
                        return (operation(oprand1,oprand2),remainOperationEvaluation2.remainingOps)
                    }
                }
            }
        }
        return (nil,ops)
    }
    
    func evaluate() -> Double? {
      
        let (result,remain) = evaluate1(opStack)
        print("\(opStack)"+"=\(result)"+" remain \(remain)")
        return result
    }
        
    func pushOperand(operand:Double) -> Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
        
    func pushOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
    func performOperation(symbol:String) -> Double? {
        if let operation = knownOps[symbol]{
            opStack.append(operation)
        }
        return evaluate()
    }
    
    func clear()  {
        opStack.removeAll()
    }

    
}