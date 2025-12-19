//
//  ConditionalSimulation.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class ConditionalSimulation {
    func solution(_ nums: [Int]) -> [Int] {
        let nums = nums
        var result: [Int] = []

        for i in 0..<nums.count {
            var num = nums[i]
            if i == 0 {
                if num % 2 == 0 {
                    num /= 2
                }
            } else {
                if num == nums[i - 1] {
                    num += 1
                }
                if num % 2 == 0 {
                    num /= 2
                }
            }
            result.append(num)
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        var result: [Int] = []

        for i in 0..<nums.count {
            var num = nums[i]

            // 1. 짝/홀 처리
            if num % 2 == 0 {
                num /= 2
            }

            // 2. 이전 결과값과 같다면 반복 처리
            while let prev = result.last, num == prev {
                num += 1
                if num % 2 == 0 {
                    num /= 2
                }
            }
            result.append(num)
        }
        return result
    }
}
