//
//  CheatSheet.swift
//  CodingTest
//
//  Created by 백래훈 on 1/6/26.
//

import Foundation

struct Item {
    let key: String
    let name: String
    let score: String
}

struct User2 {
    let key: String
    let name: String
}

final class CheatSheet {
    /// 0) 입력/출력 기본
    func inputOutputSingleAndMulti() {
        let n = Int(readLine()!)!

        var nums: [Int] = []
        for _ in 0..<n { nums.append(Int(readLine()!)!) }
    }

    /// 1-1) HashMap 카운팅 / 빈도수 (Int)
    func hashMapIntCount() {
        let arr = readLine()!.split(separator: " ").map { Int($0)! }
        var freq: [Int: Int] = [:]

        for x in arr { freq[x, default: 0] += 1 }

        let best = freq.max { $0.value < $1.value }

        print(freq)
        print(best?.key, best?.value)
    }

    /// 1-2) HashMap 카운팅 / 빈도수 (Character)
    func hashMapCharCount() {
        let arr = readLine()!.split(separator: " ").map { String($0) }
        var freq: [Character: Int] = [:]

        for x in arr { freq[Character(x), default: 0] += 1 }

        let best = freq.max { $0.value < $1.value }

        print(freq)
        print(best?.key, best?.value)
    }

    /// 2-1) 그룹핑 (key별 배열 묶기)
    func groupByKey(_ items: [Item]) {
        var groups: [String: [Item]] = [:]
        items.forEach { groups[$0.key, default: []].append($0) }
    }

    /// 2-2) 순서 유지하며 병합(defaults 기준) / key 기준으로 매핑 / lookup table 생성
    func mergeSortedArrays(_ defaults: [User2], _ users: [User2]) -> [User2] {
        let userMap = Dictionary(uniqueKeysWithValues: users.map { ($0.key, $0) })
        let merged = defaults.map { userMap[$0.key] ?? $0 }

        return merged
    }

    /// 3-1) 정렬 패턴 (다중 조건)
    func sortedPattern(_ items: [Item]) {
        let sorted = items.sorted { lhs, rhs in
            if lhs.score == rhs.score { return lhs.name < rhs.name }
            return lhs.score > rhs.score
        }
    }

    /// 3-2) 정렬 패턴 (다중 조건 / 튜플)
    func sortedTuplePattern(_ items: [(Int, Int)]) {
        let sorted = items.sorted {
            if $0.0 != $1.0 { return $0.0 < $1.0 }
            return $0.1 < $1.1
        }
    }

    /// 3-3) Top K 제한
    func topK(_ k: Int, items: [Int]) -> [Int] {
        let topK = items.prefix(k)
        return Array(topK)
    }

    /// 4-1) 중복 제거 (Set)
    func removeDuplicateSet(_ input: [Int]) -> [Int] {
        return Array(Set(input))
    }

    /// 4-2) 순서 유지 중복 제거
    func removeDuplicateKeepOrder(_ input: [Int]) -> [Int] {
        var seen = Set<Int>()
        var result: [Int] = []
        for x in input where !seen.contains(x) {
            seen.insert(x)
            result.append(x)
        }
        return result
    }

    /// 5) 투 포인터 (정렬된 배열 / 합 / 구간)
    func twoPointerSum(_ arr: [Int], _ target: Int) {
        let a = arr.sorted()
        var l = 0, r = a.count - 1

        while l < r {
            let sum = a[l] + a[r]
            if sum == target { break }
            else if sum < target { l += 1 }
            else { r -= 1 }
        }
    }

    /// 6-1) 슬라이딩 윈도우 (연속 구간) / 길이 k 합 최대
    func slidingWindowSum(_ arr: [Int], _ k: Int) {
        guard !arr.isEmpty else { return }

        var sum = arr.prefix(k).reduce(0, +)
        var best = sum

        for i in k..<arr.count {
            sum += arr[i] - arr[i - k]
            best = max(best, sum)
        }
    }

    /// 6-2) 슬라이딩 윈도우 / 조건을 만족하는 최소 길이 (예: 합 >= s)
    /// 요약
    /// 1. for -> 조건을 만족시키기 위해 늘림
    /// 2. while -> 조건을 만족하는 동안 최소화
    /// 3. 목적이 '최소 길이'라서 while이 반드시 필요
    /// 4. 시간복잡도는 O(n) / 각 포인터가 한 방향으로만 이동 / 전체 O(n)
    /// ex) [2, 3, 1, 2, 4, 3]
    func minWindowSubarray(_ arr: [Int], _ s: Int) -> Int {
        var l = 0
        var sum = 0
        var ans = Int.max

        for r in 0..<arr.count {
            sum += arr[r]
            while sum >= s {
                ans = min(ans, r - l + 1)
                sum -= arr[l]
                l += 1
            }
        }
        return ans == Int.max ? 0 : ans
    }

    /// 7) 스택 (괄호 / 오큰수 / 중복 제거)
    func stackExample(_ s: [Character]) -> Bool {
        var st: [Character] = []

        for ch in s {
            if ch == "(" { st.append(ch) }
            else {
                if st.isEmpty { return false }
                st.removeLast()
            }
        }
        return st.isEmpty
    }

    /// 8) 큐 / BFS (간단 템플릿)
    func queueExample() {
        // 0 = 이동 가능, 1 = 벽
        let grid = [
            [0, 0, 1, 0],
            [1, 0, 1, 0],
            [0, 0, 0, 0],
            [0, 1, 1, 0]
        ]
        let n = grid.count
        let m = grid[0].count

        // 방문 여부 + 거리 기록
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var dist = Array(repeating: Array(repeating: 0, count: m), count: n)

        // 상, 하, 좌, 우 이동
        let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]

        // 큐 (배열 + head 포인터)
        var queue: [(Int, Int)] = [(0, 0)]
        var head = 0
        visited[0][0] = true

        while head < queue.count {
            let (x, y) = queue[head]
            head += 1

            for (dx, dy) in dirs {
                let nx = x + dx
                let ny = y + dy

                // 범위 체크
                if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                // 벽이거나 이미 방문
                if grid[nx][ny] == 1 || visited[nx][ny] { continue }

                visited[nx][ny] = true
                dist[nx][ny] = dist[x][y] + 1
                queue.append((nx, ny))
            }
        }
        let result = visited[n - 1][m - 1] ? dist[n - 1][m - 1] : -1
        print("최단 거리: \(result)")
    }

    /// 9) 구간 겹침 (회의실/예약 충돌) - 정렬 후 스캔
    func mergeExample(_ intervals: [Reservation]) {
        let sorted = intervals.sorted { $0.start < $1.start }
        var prevEnd = sorted[0].end

        for cur in sorted.dropFirst() {
            if cur.start < prevEnd {
                // 겹침
                prevEnd = max(prevEnd, cur.end) // 연쇄 겹침 대비
            } else {
                prevEnd = cur.end
            }
        }
    }

    /// 10) 문자열 정규화 (공백 / 대소문자 / 숫자 추출)
    func stringNormalizeExample(_ input: String) {
        // 앞뒤 공백 제거 + 소문자
        let normalized = input.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        // 내부 연속 공백 축약
        let collapsed = input.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")

        // 숫자만 남기기 (전화번호)
        let digits = input.filter { $0.isNumber }
    }
}
