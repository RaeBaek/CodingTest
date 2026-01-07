//
//  ThirdQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/7/26.
//

import Foundation

struct Product {
    let productId: Int
    let score: Int
}

final class ThirdQuestion2 {
    /// 규칙
    /// 1) 점수가 높은 상품 우선
    /// 2) 점수가 같으면 productId 작은 순 (오름차순)
    /// 3) k가 상품 수보다 크면 전부 반환
    func solution(_ products: [Product], k: Int) -> [Product] {
        // 1) 점수가 높은 상품 우선 + 점수가 같으면 productId 작은 순 정렬
        let sorted = products.sorted {
            if $0.score == $1.score { return $0.productId < $1.productId }
            return $0.score > $1.score
        }

        // 2) k가 상품 수보다 크면 전부 반환
        guard !(k > sorted.count) else { return products }

        // 3) 최대 k개 상품만 추천
        return Array(sorted.prefix(k))
    }

    func solution2(_ products: [Product], k: Int) -> [Product] {
        guard k > 0 else { return [] }

        // 1) 점수가 높은 상품 우선 + 점수가 같으면 productId 작은 순 정렬
        let sorted = products.sorted {
            if $0.score == $1.score { return $0.productId < $1.productId }
            return $0.score > $1.score
        }

        // 2) k가 상품 수보다 크면 전부 반환
        if k >= sorted.count { return sorted }

        // 3) 최대 k개 상품만 추천
        return Array(sorted.prefix(k))
    }
}
