//
//  MakingABigNumber.swift
//  CodingTest
//
//  Created by 백래훈 on 4/14/25.
//

import Foundation

final class MakingABigNumber {
    func solution(_ number: String, _ k: Int) -> String {
        var number = number
        var numbers = [Int]()
        
        for i in number.indices {
            for j in number.indices where i != j {
                number.remove(at: i)
                number.remove(at: j)
                numbers.append(Int(number)!)
            }
        }
        
        return String(describing: numbers.max())
    }
    
    func solution2(_ number: String, _ k: Int) -> String {
        var stack: [Character] = []
        var count = k
        
        for num in number {
            while !stack.isEmpty && count > 0 && stack.last! < num {
                stack.removeLast()
                count -= 1
            }
            stack.append(num)
        }
        
        // 같은 수의 존재로 제거하지 못한 수가 있다면
//        if count > 0 {
//            stack = Array(stack.dropLast(count))
//        }
        
        // 배열의 prefix를 활용한다면 if count > 0 문을 사용할 필요가 없을 것 이다.
        return String(stack.prefix(stack.count - count))
        
//        return String(stack)
    }
}
