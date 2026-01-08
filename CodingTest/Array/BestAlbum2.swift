//
//  BestAlbum2.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class BestAlbum2 {
    /// 가장 많이 재생된 노래를 2개씩 모아서 앨범 출시
    /// 노래는 고유 번호(index)로 구분
    /// 속한 노래가 많이 재생된 장르를 먼저 수록 (total)
    /// 장르 내에서 많이 재생된 노래를 먼저 수록 (play)
    /// 장르 내에서 재생 횟수가 같다면 고유 번호가 낮은 노래를 먼저 수록
    func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
        var dict: [String: [(index: Int, play: Int)]] = [:]
        var result: [Int] = []

        for (index, genre) in genres.enumerated() {
            dict[genre, default: []].append((index, plays[index]))
        }

        let totalSorted = dict.sorted {
            return $0.value.reduce(0) { $0 + $1.play } > $1.value.reduce(0) { $0 + $1.play }
        }

        let playSorted = totalSorted.flatMap {
            return $0.value.sorted {
                if $0.play == $1.play { return $0.index < $1.index }
                return $0.play > $1.play
            }
        }

        for i in 0...3 {
            result.append(playSorted[i].index)
        }

        return result
    }

    func solution2(_ genres: [String], _ plays: [Int]) -> [Int] {
        var dict: [String: [(index: Int, play: Int)]] = [:]
        var result: [Int] = []

        for (index, genre) in genres.enumerated() {
            dict[genre, default: []].append((index, plays[index]))
        }

        let totalSorted = dict.sorted {
            return $0.value.reduce(0) { $0 + $1.play } > $1.value.reduce(0) { $0 + $1.play }
        }

        // 장르별로 (play 내림차순, index 오름차순) 정렬 후 최대 2곡씩 선택
        for (_, songs) in totalSorted {
            let sortedSongs = songs.sorted {
                if $0.play != $1.play { return $0.play > $1.play }
                return $0.index < $1.index
            }

            for song in sortedSongs.prefix(2) {
                result.append(song.index)
            }
        }
        return result
    }

    func solution3(_ genres: [String], _ plays: [Int]) -> [Int] {
        var songByGenre: [String: [(index: Int, play: Int)]] = [:]
        var totalByGenre: [String: Int] = [:]

        for i in genres.indices {
            let g = genres[i]
            let p = plays[i]
            songByGenre[g, default: []].append((i, p))
            totalByGenre[g, default: 0] += p
        }

        // 장르 정렬: 총합 내림차순
        let sortedGenres = totalByGenre.keys.sorted {
            totalByGenre[$0, default: 0] > totalByGenre[$1, default: 0]
        }

        var result: [Int] = []

        for g in sortedGenres {
            guard let songs = songByGenre[g] else { continue }

            // 노래 정렬: play 내림차순, index 오름차순
            let sortedSongs = songs.sorted {
                if $0.play != $1.play { return $0.play > $1.play }
                return $0.index < $1.index
            }

            result.append(sortedSongs[0].index)
            if sortedSongs.count > 1 { result.append(sortedSongs[1].index) }
        }
        return result
    }
}
