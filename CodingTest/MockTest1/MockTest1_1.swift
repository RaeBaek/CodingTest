//
//  MockTest1_1.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class MockTest1_1 {
    func solution(_ s: String) -> String {
        var count = 0
        var current: Character? = nil
        var result: [Any] = []

        for char in s {
            if current == nil {
                current = char
            } else if char != current {
                result.append(current!)
                result.append(count)
                current = char
                count = 0
            }
            count += 1
        }
        
//        result.append(current!)
//        result.append(count)

        return String(describing: result)
    }

    func solution2(_ s: String) -> String {
        if s.isEmpty { return ""}

        var result = ""
        var current = s.first!
        var count = 0

        for char in s {
            if char == current {
                count += 1
            } else {
                // 이전 문자 처리
                result.append(current)
                if count > 1 {
                    result.append(String(count))
                }
                current = char
                count = 1
            }
        }

        // 마지막 그룹 처리가 중요
        result.append(current)
        if count > 1 {
            result.append(String(count))
        }

        return result
    }
}
