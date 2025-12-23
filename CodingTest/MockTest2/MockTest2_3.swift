//
//  MockTest2_3.swift
//  CodingTest
//
//  Created by 백래훈 on 12/23/25.
//

import Foundation

final class MockTest2_3 {
    func solution(_ s: String, _ k: Int) -> Int {
        var result: [String] = []
        let chars = Array(s)

        for i in 0...(s.count - k) {
            var value = ""
            for j in 0...(k - 1) {
                if !value.contains(String(chars[i + j])) {
                    value.append(chars[i + j])
                }
            }
            if value.count == k {
                result.append(value)
            }
        }
        print(result)
        return result.count
    }

    func solution2(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var freq: [Character: Int] = [:]
        var left = 0
        var result = 0

        for right in 0..<chars.count {
            freq[chars[right], default: 0] += 1

            // 윈도우 크기 k 유지
            if right - left + 1 > k {
                let leftChar = chars[left]
                freq[leftChar]! -= 1
                if freq[leftChar] == 0 {
                    freq[leftChar] = nil
                }
                left += 1
            }

            // 정확히 길이 k일 때 검사
            if right - left + 1 == k && freq.count == k {
                result += 1
            }
        }
        return result
    }
}

/*
 havefunonleetcode
 havef O
 avefu O
 vefun O
 efuno O
 funon X
 unonl X
 nonle X
 onlee X
 nleet X
 leetc X
 eetco X
 etcod O
 tcode O
 */
