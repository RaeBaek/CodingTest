//
//  MockTest2_4.swift
//  CodingTest
//
//  Created by 백래훈 on 12/24/25.
//

import Foundation

final class MockTest2_4 {
    func solution(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        result.reserveCapacity(nums.count)
        result.append(nums.first!)

        for i in 1..<nums.count {
            var value = nums[i]
            while value < result.last! {
                value += (result.last! - value)
                if value % 2 == 0 {
                    value /= 2
                }
            }
            result.append(value)
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        guard let first = nums.first else { return [] }

        var result: [Int] = []
        result.reserveCapacity(nums.count)
        result.append(first)

        for i in 1..<nums.count {
            var value = nums[i]
            let prev = result.last!

            while value < prev {
                let before = value
                value += (prev - value)

                if value.isMultiple(of: 2) {
                    value /= 2
                }

                if value == before {
                    break
                }
            }
            result.append(value)
        }
        return result
    }
}
