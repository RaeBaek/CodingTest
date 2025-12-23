//
//  DifferenceBetweenNumbers.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class DifferenceBetweenNumbers {
    func solution(_ nums: [Int]) -> [Int] {
        var index = 1
        var result: [Int] = [0]

        while index < nums.count {
            if nums[index] > nums[index - 1] {
                result.append(nums[index] - nums[index - 1])
            } else {
                result.append(0)
            }
            index += 1
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }

        var result: [Int] = []
        result.reserveCapacity(nums.count)
        result.append(0)

        for i in 1..<nums.count {
            result.append(nums[i] > nums[i - 1] ? nums[i] - nums[i - 1] : 0)
        }
        return result
    }
}
