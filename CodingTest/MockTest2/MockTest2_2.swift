//
//  MockTest2_2.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class MockTest2_2 {
    func solution(_ nums: [Int]) -> [Int] {
        var result: [Int] = []

        for num in nums {
            result.append(nums.reduce(1, {
                if $1 != num {
                    $0 * $1
                } else {
                    $0 * 1
                }
            }))
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 1, count: n)

        // 1. 왼쪽 곱
        var leftProduct = 1
        for i in 0..<n {
            result[i] = leftProduct // 인덱스가 0일 땐 기본값 1을 그 이후엔 누적된 값
            leftProduct *= nums[i]  // 다음 작업을 위해 현재 값을 곱합
        }

        // 2. 오른쪽 곱
        var rightProduct = 1
        for i in stride(from: n - 1, through: 0, by: -1) {
            result[i] *= rightProduct // 오른쪽 곱도 똑같이 인덱스가 n-1일 땐 1을 그 이후엔 누적된 값
            rightProduct *= nums[i]   // 다음 작업을 위해 현재 값을 곱합
        }
        return result
    }
}
