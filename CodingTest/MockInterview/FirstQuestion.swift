//
//  FirstQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/6/26.
//

import Foundation

final class FirstQuestion {
    func mostFrequentEvent(_ events: [String]) -> String? {
        var dict: [String: Int] = [:]

        events.forEach { dict[$0, default: 0] += 1 }

        let sorted = dict.sorted {
            if $0.value != $1.value { return $0.value > $1.value }
            return $0.key < $1.key
        }

        return sorted.max { $0.value < $1.value }?.key
    }
}
