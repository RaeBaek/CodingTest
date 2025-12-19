//
//  ConsecutiveNumbers.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class ConsecutiveNumbers {
    func solution(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        var current: Character? = nil

        for c in chars {
            if c != current {
                count += 1
                current = c
            }
        }
        return count
    }
}
