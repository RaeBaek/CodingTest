//
//  APIResponseProcessing.swift
//  CodingTest
//
//  Created by 백래훈 on 1/4/26.
//

import Foundation

struct Content {
    let id: String
    let type: String
    let title: String
    let score: Double
}

/// 열거형을 사용할 수 있지만 보통 API 응답은 대부분 String으로 오기에
/// 사용 시 별도의 처리 과정 필요
enum MediaType: String {
    case movie
    case tv
    case person
}

final class APIResponseProcessing {
    func solution(_ inputs: [Content], top k : Int) -> [(String, [Content])] {
        var dict: [String: [Content]] = [:]

        inputs.forEach {
            if $0.type.isEmpty {
                // 미디어 타입이 없는 경우라면?
            } else {
                dict[$0.type, default: []].append($0)
            }
        }

        let maped = dict.map {
            let sorted = $0.value.sorted {
                if $0.score == $1.score {
                    return $0.title < $1.title
                }
                return $0.score > $1.score
            }.prefix(k)

            return [$0.key: sorted]
        }

        return [("movie", [])]
    }

    func solution2(_ inputs: [Content], top k : Int) -> [(String, [Content])] {
        // 1) 그룹핑
        var dict: [MediaType: [Content]] = [:]

        for item in inputs {
            guard !item.type.isEmpty, let type = MediaType(rawValue: item.type) else {
                // type이 비어있거나(movie/tv/person 이외) 알 수 없는 값이면 무시
                continue
            }
            dict[type, default: []].append(item)
        }

        // 2) 정렬 & Top K개 선정
        func topK(_ items: [Content]) -> [Content] {
            let sorted = items.sorted { lhs, rhs in
                if lhs.score == rhs.score {
                    return lhs.title < rhs.title
                }
                return lhs.score > rhs.score
            }
            if k <= 0 { return [] }

            return Array(sorted.prefix(k))
        }

        // 3) 최종 정렬
        let orderTypes: [MediaType] = [.movie, .tv, .person]
        var result: [(String, [Content])] = []
        result.reserveCapacity(orderTypes.count)

        for type in orderTypes {
            let items = topK(dict[type] ?? [])
            // 섹션이 비어도 반환할지 여부는 정책이지만, 문제 조건에 따라 섹션을 항상 만들도록 유지
            result.append((type.rawValue, items))
        }

        return result
    }
}
