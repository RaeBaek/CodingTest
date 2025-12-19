//
//  multipleOfN.swift
//  CodingTest
//
//  Created by 백래훈 on 3/20/25.
//

import Foundation

final class MultipleOfN {
    func solution(_ n: Int, _ numList: [Int]) -> [Int] {
        return numList.filter { $0 % n == 0 }
    }
}
