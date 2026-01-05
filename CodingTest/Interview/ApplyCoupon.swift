//
//  ApplyCoupon.swift
//  CodingTest
//
//  Created by 백래훈 on 1/5/26.
//

import Foundation

final class ApplyCoupon {
    func solution(_ price: Int, coupons: [String]) -> Int {
        var discountPrice: [Int] = []

        for coupon in coupons {
            var price = price
            if coupon.contains("%") {
                let strings = coupon.split(separator: "%")
                price *= (100 - (Int(strings.first ?? "") ?? 0)) / 100
            } else if coupon.contains("원") {
                let strings = coupon.split(separator: "원")
                price -= (Int(strings.first ?? "") ?? 0)
            }
            discountPrice.append(price)
        }
        print(discountPrice)
        return discountPrice.min() ?? 0
    }

    func solution2(_ price: Int, coupons: [String]) -> Int {
        guard !coupons.isEmpty else { return price }

        func applyCoupon(_ coupon: String, to price: Int) -> Int {
            let trimmed = coupon.trimmingCharacters(in: .whitespacesAndNewlines)
            let original = Double(price)

            // 퍼센트 쿠폰의 경우
            if trimmed.hasSuffix("%") {
                let numberPart = trimmed.dropLast() // % 제거
                let percent = Double(numberPart) ?? 0
                let discounted = original * (1.0 - percent / 100.0)
                return max(0, Int(floor(discounted)))
            }

            // 정액 쿠폰의 경우
            if trimmed.hasSuffix("원") {
                let numberPart = trimmed.dropLast()
                let sanitized = numberPart.replacingOccurrences(of: ",", with: "")
                let amount = Double(sanitized) ?? 0
                let discounted = original - amount
                return max(0, Int(floor(discounted)))
            }

            // 두 경우가 아닌 경우
            return price
        }

        let discountedPrices = coupons.map { applyCoupon($0, to: price) }
        print(discountedPrices)
        return discountedPrices.min() ?? price
    }
}
