//
//  MutipleStrings.swift
//  CodingTest
//
//  Created by 백래훈 on 3/20/25.
//

import Foundation

final class MultipleStrings {
    func solution(_ string: String, _ k: Int) -> String {
        var answer = ""
        
        for _ in 0..<k {
            answer.append(string)
        }
        
        return answer
    }
    
    func solution2(_ string: String, _ k: Int) -> String {
        return (1...k).reduce("") { partialResult, _ in
            partialResult + string
        }
    }
    
    func solution3(_ string: String, _ k: Int) -> String {
        return Array(repeating: string, count: k).joined()
    }
}
