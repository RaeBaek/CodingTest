//
//  ReportResults.swift
//  CodingTest
//
//  Created by 백래훈 on 4/28/25.
//

import Foundation

final class ReportResults {
    func solution1(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
        var reportDictionary = [String: Int]()
        
        var lastReporter: String = ""
        var lastReporting: String = ""
        
        for i in 0..<id_list.count {
            var words = id_list[i].split(separator: " ")
            var first = String(words.first!)
            var last = String(words.last!)
            
            if first == lastReporter && last != lastReporting {
                var count = reportDictionary[last] ?? 0
                count += 1
                reportDictionary[last] = count
            } else if first != lastReporter {
                
            }
        }
        
        return []
    }
    
    func solution2(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
        var reportDict = [String: Set<String>]() // 신고자 -> 신고한 대상들
        var reportedCount = [String: Int]()      // 대상 -> 신고당한 횟수
        
        // 중복 제거 후 신고 기록 저장
        for entry in Set(report) {
            let info = entry.split(separator: " ").map { String($0) }
            let reporter = info[0]
            let reported = info[1]
            
            reportDict[reporter, default: []].insert(reported)
            reportedCount[reported, default: 0] += 1
        }
        
        // 정지된 유저 찾기
        // 시간 초과 발생 -> Set 사용 필요
//        let suspended = reportedCount.filter { $0.value >= k }.map { $0.key }
        let suspended = Set(reportedCount.filter { $0.value >= k }.map { $0.key })
        
        // 메일 보내기
        var result = [Int]()
        
        for id in id_list {
            let reported = reportDict[id] ?? []
            let count = reported.filter { suspended.contains($0) }.count
            result.append(count)
        }
        
        return result
    }
}
