//
//  BestAlbum.swift
//  CodingTest
//
//  Created by 백래훈 on 4/7/25.
//

import Foundation

final class BestAlbum {
//    func solution(_ genres: [String], _ player: [Int]) -> [Int] {
//        var genreDict: [String: [(Int, Int)]] = [:]
//        var result: [Int] = []
//        
//        for i in 0..<genres.count {
//            if genreDict[genres[i]] == nil {
//                genreDict[genres[i]] = [(player.firstIndex(of: i)!, player[i])]
//            } else {
//                genreDict[genres[i]]?.append((player.firstIndex(of: i)!, player[i]))
//            }
//        }
//        
//        for (key, value) in genreDict {
//            genreDict[key] = value.sorted(by: { value1, value2 in
//                return value1.1 > value2.1
//            })
//        }
//        
//        result.append(value)
//        result.append(value.1)
//        
//        return []
//    }
    
    func solution2(_ genres: [String], _ plays: [Int]) -> [Int] {
        var genreDict: [String: [(Int, Int)]] = [:]
        var genrePlayCount: [String: Int] = [:]
        var result: [Int] = []
        
        for i in 0..<genres.count {
            let genre = genres[i]
            let play = plays[i]
            genreDict[genre, default: []].append((i, play))
            genrePlayCount[genre, default: 0] += play
        }
        
        let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }
        
        for genre in sortedGenres {
            if let songs = genreDict[genre.key] {
                let sortedSongs = songs.sorted {
                    if $0.1 == $1.1 { return $0.0 < $1.0 }
                    return $0.1 > $1.1
                }
                result += sortedSongs.prefix(2).map { $0.0 }
            }
        }
        return result
    }
    
    
    func solution3(_ genres:[String], _ plays:[Int]) -> [Int] {
        var answer: [Int] = []
        var dict: [String: [[Int]]] = [:]
        
        for idx in 0..<genres.count {
            if let _ = dict[genres[idx]] {
                dict[genres[idx]]?.append([idx, plays[idx]])
            } else {
                dict[genres[idx]] = [[idx, plays[idx]]]
            }
        }
        
        let sortedDict = dict.sorted { (first, second) -> Bool in
            return first.value.map { $0[1] }.reduce(0, +) > second.value.map { $0[1] }.reduce(0, +)
        }
        
        for idx in 0..<sortedDict.count {
            let item = sortedDict[idx].value.sorted { (first, second) -> Bool in
                return first[1] == second[1] ? false : first[1] > second[1]
            }
            
            for idx in 0..<item.count {
                if idx > 1 {
                    break
                }
                answer.append(item[idx][0])
            }
        }
        return answer
    }
}
