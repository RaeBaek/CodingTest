//
//  HighestAppearances.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class HighestAppearances {
    func solution(_ s: String) -> Character {
        var result: [Character: Int] = [:]

        for char in s {
            result[char, default: 0] += 1
        }

        return result.max(by: { $0.value < $1.value })!.key
    }

    func solution2(_ s: String) -> Character {
        var freq: [Character: Int] = [:]
        s.forEach { freq[$0, default: 0] += 1 }
        return freq.max { $0.value < $1.value }!.key
    }
}
