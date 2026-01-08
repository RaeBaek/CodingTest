//
//  FourthQuestion2.swift
//  CodingTest
//
//  Created by 백래훈 on 1/7/26.
//

import Foundation

final class FourthQuestion2 {
    /// 물류 센터(노드)들이 도로(간선)로 연결되어 있고,
    /// 각 도로에는 배송 비용(가중치)이 있다.
    /// 출발지에서 도착지까지 배송할 때 최소 비용을 구하라.
    ///
    func minDeliveryCost(
        n: Int,
        edges: [(from: Int, to: Int, cost: Int)],
        start: Int,
        end: Int
    ) -> Int {
        return 0
    }

    /// 반환: 1차원 배열 반환
    /// 1) n행, n열 크기의 2차원 empty 배열
    /// 2) 1행, 1열은 1 / 2행, 2열은 2 / 3행, 3열은 3
    /// 3) 2차원 배열 -> 1차원 배열로 정렬
    /// 4) arr[left] ~ arr[right]만 남기고 나머지는 삭제
    ///
    /// [1, 2, 3, 4]
    /// [2, 2, 3, 4]
    /// [3, 3, 3, 4]
    /// [4, 4, 4, 4]

    /// [1, 2, 3, 4, 5]
    /// [2, 2, 3, 4, 5]
    /// [3, 3, 3, 4, 5]
    /// [4, 4, 4, 4, 5]
    /// [5, 5, 5, 5, 5]
    func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
        var twoArr: [[Int]] = [[]]

        for i in 1...n {
            var arr: [Int] = []
            for j in 1...n {
                if arr.count < i {
                    arr.append(i)
                } else {
                    arr.append(j)
                }
            }
            twoArr.append(arr)
            arr.removeAll()
        }

        return Array(twoArr.flatMap { $0 }[Int(left)...Int(right)])
    }

    /// 2차원 배열을 만들지 말고,
    /// 필요한 index만 골라서
    /// 그 index가 가리키는 (row, col)을 계산한 뒤
    /// 바로 값을 만들어내자
    func solution2(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
        let n64 = Int64(n)
        var result: [Int] = []
        result.reserveCapacity(Int(right - left + 1))

        for k in left...right {
            let row = k / n64
            let col = k % n64
            let value = max(row, col) + 1 // row+1, col+1 중 큰 값
            result.append(Int(value))
        }
        return result
    }

    func solution4(_ s: String) -> String {
        var low: [Character] = []
        var up: [Character] = []

        for char in s {
            if char.isLowercase {
                low.append(char)
            } else {
                up.append(char)
            }
        }

        return String(low.sorted(by: >)) + String(up.sorted(by: >))
    }
}
