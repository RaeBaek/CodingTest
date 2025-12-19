//
//  TargetNumber.swift
//  CodingTest
//
//  Created by 백래훈 on 3/17/25.
//

import Foundation

final class TargetNumber {
    func solution(_ numbers: [Int], _ target: Int) -> Int {
        var count = 0
        
        func dfs(index: Int, sum: Int) {
            if index == numbers.count {
                if sum == target {
                    count += 1
                }
                return
            }
            dfs(index: index + 1, sum: sum + numbers[index])
            dfs(index: index + 1, sum: sum - numbers[index])
        }
        
        dfs(index: 0, sum: 0)
        print(count)
        return count
    }
}
