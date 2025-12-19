//
//  DoublePriorityQueue.swift
//  CodingTest
//
//  Created by 백래훈 on 3/24/25.
//

import Foundation

final class DoublePriorityQueue {
    func solution(_ operations: [String]) -> [Int] {
        
        var queue: [Int] = []
        var answer: [Int] = []
        
        for operation in operations {
            let splitOperation = operation.split(separator: " ")
            
            if splitOperation.first == "I" {
                queue.append(Int(splitOperation.last!)!)
                print("추가된 값", Int(splitOperation.last!)!)
            } else if splitOperation.first == "D" {
                if queue.isEmpty {
                    continue
                }
                
                if splitOperation.last == "1" {
                    let maxValue = queue.max(by: <)
                    print("Max 값:", maxValue!)
                    
                    queue = checkValue(queue: queue, value: maxValue)
                } else if splitOperation.last == "-1" {
                    let minValue = queue.min(by: <)
                    print("Min 값:", minValue!)
                    
                    queue = checkValue(queue: queue, value: minValue)
                }
            }
        }
        
        if !queue.isEmpty {
            for value in queue {
                if value == queue.max(by: <)! {
                    answer.append(value)
                } else if value == queue.min(by: <)! {
                    answer.append(value)
                }
            }
            answer = answer.sorted(by: >)
        } else {
            answer = [0, 0]
        }
        
        print(answer)
        return answer
    }
    
    func solution2(_ operations: [String]) -> [Int] {
        var queue: [Int] = []
        var answer: [Int] = []
        
        operations.forEach {
            let splitOperation = $0.split(separator: " ")
            
            if splitOperation.first == "I" {
                queue.append(Int(splitOperation.last!)!)
                print("추가된 값", Int(splitOperation.last!)!)
            } else if splitOperation.first == "D" {
                if queue.isEmpty {
                    print("큐가 비어있습니다.")
//                    continue
                }
                
                if splitOperation.last == "1" {
                    let maxValue = queue.max(by: <)
                    print("Max 값:", maxValue!)
                    
                    queue = checkValue(queue: queue, value: maxValue)
                } else if splitOperation.last == "-1" {
                    let minValue = queue.min(by: <)
                    print("Min 값:", minValue!)
                    
                    queue = checkValue(queue: queue, value: minValue)
                }
            }
        }
        
        if !queue.isEmpty {
            for value in queue {
                if value == queue.max(by: <)! {
                    answer.append(value)
                } else if value == queue.min(by: <)! {
                    answer.append(value)
                }
            }
            answer = answer.sorted(by: >)
        } else {
            answer = [0, 0]
        }
        
        return answer
    }
    
    func checkValue(queue: [Int], value: Int?) -> [Int] {
        var queue = queue
        
        for number in queue {
            if number == value! {
                if let index = queue.firstIndex(of: number) {
                    queue.remove(at: index)
//                    print("Max 값 삭제:", value!)
                }
            }
        }
        return queue
    }
    
    func solution3(_ operations: [String]) -> [Int] {
        var queue: [Int] = []
        
        for operation in operations {
            let operationArray = operation.split(separator: " ")
            
            switch operationArray.first {
            case "I":
                queue.append(Int(operationArray.last!)!)
            case "D":
                if queue.isEmpty {
                    continue
                }
                if operationArray.last == "1" {
                    guard let max = queue.max() else { continue }
                    if let maxIndex = queue.firstIndex(of: max) {
                        queue.remove(at: maxIndex)
                    }
                } else if operationArray.last == "-1" {
                    guard let min = queue.min() else { continue }
                    if let minIndex = queue.firstIndex(of: min) {
                        queue.remove(at: minIndex)
                    }
                }
            default:
                break
            }
        }
        
        print("현재 큐: \(queue)")
        
        if queue.isEmpty {
            return [0, 0]
        } else {
            return [queue.max()!, queue.min()!]
        }
    }
}
