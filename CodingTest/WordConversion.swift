//
//  WordConversion.swift
//  CodingTest
//
//  Created by 백래훈 on 3/19/25.
//

import Foundation

final class WordConversion {
    func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
        guard words.contains(target) else { return 0 }
        
        var queue: [(word: String, depth: Int)] = [(begin, 0)]
        var checked: Set<String> = [begin]
        
        while !queue.isEmpty {
            
            let (currentWord, depth) = queue.removeFirst()
            
            // 현재 처리 중인 단어
            print("현재 단어: \(currentWord), 변환 단계: \(depth)")
            
            if currentWord == target {
                return depth
            }
            
            for word in words {
                if !checked.contains(word), canTransform(currentWord, word) {
                    checked.insert(word)
                    queue.append((word, depth + 1))
                    
                    // 큐에 추가된 단어 출력
                    print("추가된 단어: \(word), 변환 단계: \(depth + 1)")
                }
            }
            // 현재 큐 상태 출력
            print("큐 상태: \(queue)")
            print("체크한 단어: \(checked)")
            print("------------------------")
        }
        
        return 0
    }
    
    func canTransform(_ currentWord: String, _ transfromWord: String) -> Bool {
        let currentWord = Array(currentWord)
        let transfromWord = Array(transfromWord)
        var diffCount = 0
        
        for i in 0..<currentWord.count {
            if currentWord[i] != transfromWord[i] {
                diffCount += 1
            }
            
            if diffCount > 1 {
                return false
            }
        }
        
        return diffCount == 1
    }
}

