//
//  SplitStrings.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class SplitStrings {
    func solution(_ s: String) -> Int {
        var result: Int = 0
        var array = Array(s)
        var x: Character = "0"
        var first: Int = 0
        var second: Int = 0

        while array.count > 0 {
            x = array[0]

            for i in 0..<array.count {
                if x == array[i] {
                    first += 1
                } else {
                    second += 1
                }

                if first == second {
                    array = Array(array[i + 1..<array.count])
                    first = 0
                    second = 0
                    result += 1
                    break
                } else {
                    if i == array.count - 1 {
                        array = []
                        result += 1
                        break
                    }
                }
            }
        }
        return result
    }

    func solution2(_ s: String) -> Int {
        let arr = Array(s)
        var x: Character = "0"
        var first = 0
        var second = 0
        var result: Int = 0

        for i in 0..<arr.count {
            if first == 0 && second == 0 {
                x = arr[i]
            }

            if x == arr[i] {
                first += 1
            } else {
                second += 1
            }

            if first == second {
                first = 0
                second = 0
                result += 1
            } else {
                if i == arr.count - 1 {
                    result += 1
                }
            }
        }
        return result
    }

    func solution3(_ s: String) -> Int {
        let arr = Array(s)
        var x: Character = "\0"
        var first = 0
        var second = 0
        var result = 0

        for ch in arr {
            if first == second { x = ch }

            if ch == x { first += 1 }
            else { second += 1 }

            if first == second {
                result += 1
                first = 0
                second = 0
            }
        }
        if first != 0 || second != 0 { result += 1 }
        return result
    }
}
