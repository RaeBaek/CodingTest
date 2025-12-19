//
//  SumOfElements.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class SumOfElements {
    func solution(_ nums: [Int]) -> [Int] {
        var result: [Int] = []

        for (index, _) in nums.enumerated() {
            var nums = nums
            var _ = nums.remove(at: index)
            result.append(nums.reduce(0, { $0 + $1 }))
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        let totalSum = nums.reduce(0, +)
        var result: [Int] = []
        result.reserveCapacity(nums.count)

        for num in nums {
            result.append(totalSum - num)
        }
        return result
    }
}
