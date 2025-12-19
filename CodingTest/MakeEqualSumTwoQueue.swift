//
//  MakeEqualSumTwoQueue.swift
//  CodingTest
//
//  Created by 백래훈 on 4/23/25.
//

import Foundation

final class MakeEqualSumTwoQueue {
    func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
        var p1 = 0, p2 = 0
        
        let total = queue1.reduce(0, +) + queue2.reduce(0, +)
        if total % 2 != 0 { return -1 }
        
        let goal = total / 2
        let totalQueue = queue1 + queue2
        var sum = queue1.reduce(0, +)
        
        let maxCount = queue1.count * 3
        var count = 0
        
        while count <= maxCount {
            if sum == goal {
                return count
            } else if sum > goal {
                sum -= totalQueue[p1]
                p1 += 1
            } else {
                sum += totalQueue[(queue1.count + p2) % totalQueue.count]
                p2 += 1
            }
            count += 1
        }
        return -1
    }
}
