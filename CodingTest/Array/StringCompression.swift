//
//  StringCompression.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class StringCompression {
    /// 주어진 문자열 s를 길이 k 만큼 잘라서
    /// 같은 문자열이 연속된 경우 앞 숫자 + 문자열로 압축하는 방식
    func solution(_ s: String) -> Int {
        let n = s.count
        if n < 2 { return n }

        let arr = Array(s)
        var result = n // 최댓값 기준

        // k는 잘라낼 길이
        for k in 1...(n / 2) {
            var compressed = ""
            var prev = "" // 이전 조각
            var count = 1

            var index = 0
            while index < n {
                let end = min(index + k, n)
                let current = String(arr[index..<end])

                if current == prev {
                    count += 1
                } else {
                    // 이전 조각을 결과에 추가
                    if prev != "" {
                        compressed += (count > 1 ? "\(count)\(prev)": prev)
                    }
                    prev = current
                    count = 1
                }

                index += k
            }

            // 남아있는 마지막 조각
            compressed += (count > 1 ? "\(count)\(prev)": prev)
            result = min(result, compressed.count)
        }
        return result
    }
}
