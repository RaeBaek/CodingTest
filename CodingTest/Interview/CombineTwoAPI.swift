//
//  CombineTwoAPI.swift
//  CodingTest
//
//  Created by 백래훈 on 1/5/26.
//

import Foundation

struct User {
    let id: UUID
    let name: String
}

struct Order {
    let id: UUID
    let title: String
}

struct UserWithOrders {
    let user: User
    let orders: [Order]
}

final class CombineTwoAPI {
    func solution(_ userId: UUID) async throws -> UserWithOrders {
        // 1) 유저 조회 (실패 시 바로 throw)
        let user = try await fetchUser(userId)

        // 2) 주문 조회 (실패 시 빈 배열 fallback)
        let orders: [Order]
        do {
            orders = try await fetchOrders(userId)
        } catch {
            orders = []
        }

        return UserWithOrders(user: user, orders: orders)
    }

    // MARK: - Mock API
    func fetchUser(_ id: UUID) async throws -> User {
        // 네트워크 지연 시뮬레이션
        try await Task.sleep(nanoseconds: 200_000_000)

        // 실패 케이스
        if Bool.random() {
            throw URLError(.badServerResponse)
        }

        return User(id: id, name: "RaeHoon")
    }

    func fetchOrders(_ userId: UUID) async throws -> [Order] {
        // 네트워크 지연 시뮬레이션
        try await Task.sleep(nanoseconds: 200_000_000)

        // 실패 가능 (문제 조건상 fallback 대상)
        if Bool.random() {
            throw URLError(.cannotLoadFromNetwork)
        }

        return [
            Order(id: UUID(), title: "Americano"),
            Order(id: UUID(), title: "Latte")
        ]
    }
}
