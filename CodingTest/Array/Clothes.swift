//
//  Clothes.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class Clothes {
    /// 매일 다른 옷 조합
    /// 종류별로 최대 1가지의 의상만 착용 가능
    /// 착용한 의상 일부가 겹쳐도, 다른 의상이 겹치지 않거나 더 착용한 경우 O
    /// 같은 이름의 의상 존재 X
    func solution(_ clothes: [[String]]) -> Int {
        var dict: [String: Int] = [:]

        for clothe in clothes {
            dict[clothe[1], default: 0] += 1
        }

        return dict.values.reduce(1) { $0 * ($1 + 1) } - 1
    }

}

/*
 [["headgear": ["yellow_hat", "green_turban"]],
 ["eyewear": ["blue_sunglasses"]]]
 */

/*
 [["face": ["crow_mask", "blue_sunglasses", "smoky_makeup"]]]
 */

/*
 [["headgear": ["yellow_hat", "green_turban"]],
 ["face": ["crow_mask", "blue_sunglasses", "smoky_makeup"]],
 ["eyewear": ["blue_sunglasses"]]]
 */
