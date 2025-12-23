//
//  SumOfElements.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class SumOfElements {
    /// 결과적으로 n의 크기가 커질 수록 시간 초과 가능성이 매우 높아짐
    func solution(_ nums: [Int]) -> [Int] {
        var result: [Int] = []

        for (index, _) in nums.enumerated() {
            var nums = nums                             // 불 필요한 배열 전체 복사
            var _ = nums.remove(at: index)              // 시간 복잡도 O(n)
            result.append(nums.reduce(0, { $0 + $1 }))  // 시간 복잡도 O(n)
        }
        return result
    }

    func solution2(_ nums: [Int]) -> [Int] {
        let totalSum = nums.reduce(0, +)        // 시간 복잡도 O(n)
        var result: [Int] = []
        result.reserveCapacity(nums.count)      // 처음부터 필요한 만큼 공간 확보
                                                // 이후 append는 단순히 값만 추가
                                                // 메모리 최적화 목적
        for num in nums {
            result.append(totalSum - num)       // 자기 자신 제외한 합 = 전체합 - 현재 값
        }
        return result
    }
}
