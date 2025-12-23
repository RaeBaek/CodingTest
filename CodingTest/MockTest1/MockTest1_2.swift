//
//  MockTest1_2.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class MockTest1_2 {
    func solution(_ nums: [Int]) -> [Int] {
        let result: [Int] = []

        for num in nums {

        }

        return result
    }

    func solution4(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        guard !nums.isEmpty else { return result }

        // 현재 값
        var current = nums[0]

        for num in nums {
            // 비교할 값 (변할 값)
            var value = num

            while value < current {
                value += current - num

                if value % 2 == 0 {
                    value /= 2
                }
            }
            current = num
            result.append(value)
        }
        return result
    }

    func solution5(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        guard !nums.isEmpty else { return result }

        // 첫 번째 값은 그대로
        result.append(nums[0])

        for i in 1..<nums.count {
            var value = nums[i]
            let prev = result.last!

            if value < prev {
                value += (prev - value)
                if value % 2 == 0 {
                    value /= 2
                }
            }
            result.append(value)
        }
        return result
    }
}
