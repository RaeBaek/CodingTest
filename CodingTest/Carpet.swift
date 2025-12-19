//
//  Carpet.swift
//  CodingTest
//
//  Created by 백래훈 on 3/31/25.
//

import Foundation

final class Carpet {
    func solution(_ brown: Int, _ yellow: Int) -> [Int] {
        var pairs: [(Int, Int)] = []
        
        for i in 1...yellow {
            if yellow % i == 0 {
                let pair = (max(i, yellow / i), min(i, yellow / i))
                pairs.append(pair)
            }
        }
        
        var minDiff = Int.max
        var resultPair: (Int, Int) = (0, 0)
        
        for pair in pairs {
            let diff = pair.0 - pair.1
            if diff < minDiff {
                minDiff = diff
                resultPair = pair
            }
        }
        return [resultPair.0 + 2, resultPair.1 + 2]
    }
    
    func solution2(_ brown: Int, _ yellow: Int) -> [Int] {
        let sum = brown + yellow
        var x: Int = 0
        var y: Int = 0

        for i in 1...sum {
            if (sum % i) == 0 {
                x = sum / i
                y = i
            }
            if (x - 2) * (y - 2) == yellow {
                break
            }
        }
        return [x, y]
    }
}
