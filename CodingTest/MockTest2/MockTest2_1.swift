//
//  MockTest2_1.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class MockTest2_1 {
    func solution(_ s: String) -> String {
        var result: [Character] = []
        s.forEach { result.last != $0 ? result.append($0) : () }
        return String(result)
    }

    func solution2(_ s: String) -> String {
        var result: [Character] = []
        result.reserveCapacity(s.count)

        for num in s {
            if num != result.last {
                result.append(num)
            }
        }

        return String(result)
    }
}
