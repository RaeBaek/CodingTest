//
//  MergingNotificationSettings.swift
//  CodingTest
//
//  Created by 백래훈 on 1/5/26.
//

import Foundation

struct NotificationSetting {
    let key: String
    let isEnabled: Bool
}

final class MergingNotificationSettings {
    /// 기본 알림 설정(defaults)과 사용자 설정(user)을 병합합니다.
    ///
    /// 규칙
    /// 1) 같은 key가 있으면 사용자 설정이 우선입니다.
    /// 2) defaults에 없는 user의 key는 무시합니다. (기본에 정의되지 않은 설정은 앱에서 쓰지 않는다고 가정)
    /// 3) 결과의 순서는 defaults의 순서를 그대로 유지합니다.
    ///
    /// - Parameters:
    ///     - defaults: 앱이 제공하는 기본 설정(순서가 의미 있음)
    ///     - user: 사용자가 저장한 설정(기본을 덮어쓸 수 있음)
    /// - Returns: 병합된 설정 배열(순서는 defaults와 동일)
    func solution(
        defaults: [NotificationSetting],
        user: [NotificationSetting]
    ) -> [NotificationSetting] {
        // 사용자 설정을 key -> setting 형태로 빠르게 찾기 위한 맵
        let userMap: [String: NotificationSetting] = Dictionary(uniqueKeysWithValues: user.map { ($0.key, $0) })

        // defaults의 순서를 그대로 유지하면서 user override를 사용
        return defaults.map { base in
            if let override = userMap[base.key] {
                return override
            }
            return base
        }
    }

    // 빠른 동작 확인용 예제
    func example() {
        let defaults: [NotificationSetting] = [
            .init(key: "marketing", isEnabled: true),
            .init(key: "order", isEnabled: true),
            .init(key: "chat", isEnabled: false)
        ]

        let user: [NotificationSetting] = [
            .init(key: "chat", isEnabled: true),
            .init(key: "marketing", isEnabled: false),
            .init(key: "unknown", isEnabled: true) // defaults에 없으니 무산됨
        ]

        let merged = solution(defaults: defaults, user: user)
        merged.forEach { print("\($0.key): \($0.isEnabled)") }
    }
}
