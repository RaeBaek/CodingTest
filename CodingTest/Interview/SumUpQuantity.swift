//
//  SumUpQuantity.swift
//  CodingTest
//
//  Created by 백래훈 on 1/2/26.
//

import Foundation

struct OrderItem {
    let name: String
    let option: String
    let quantity: Int
}

final class SumUpQuantity {
    func solution(_ input: [OrderItem]) -> [OrderItem] {
        var dict: [String: Int] = [:]

        input.forEach {
            dict["\($0.name) | \($0.option)", default: 0] += $0.quantity
        }

        let dict2 = dict.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            }
            return $0.value > $1.value
        }

        return dict2.map {
            let parts = $0.key.split(separator: "|")
            return OrderItem(
                name: String(parts[0]),
                option: String(parts[1]),
                quantity: $0.value
            )
        }
    }
}

// -----------------------------------------------------------------------------

struct OrderKey: Hashable {
    let name: String
    let option: String
}

final class SumUpQuantity2 {
    func solution(_ input: [OrderItem]) -> [OrderItem] {
        var dict: [OrderKey: Int] = [:]

        input.forEach {
            let key = OrderKey(name: $0.name, option: $0.option)
            dict[key, default: 0] += $0.quantity
        }

        let sorted = dict.sorted {
            if $0.value == $1.value {
                return $0.key.name < $0.key.name
            }
            return $0.value > $1.value
        }

        return sorted.map {
            OrderItem(
                name: $0.key.name,
                option: $0.key.option,
                quantity: $0.value
            )
        }
    }
}
