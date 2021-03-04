/*
 장르별 두개씩 모아 베앨범
 노래 고유번호
 정렬해야함 노래 10000개 이하 어떤 정렬 알고리즘도 상관 없음
 
 모든 장르 횟수 중복 없음
 노래는 횟수 중복 있음
 */
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var hashTable = [String: ([Int], count: Int)]()
    
    for song in 0..<plays.count {
        if hashTable[genres[song]] == nil {
            hashTable[genres[song]] = ([Int](), count: 0)
        }
        hashTable[genres[song]]!.0.append(song)
        hashTable[genres[song]]!.count += plays[song]
    }
    
    for key in hashTable.keys {
        hashTable[key]!.0.sort {
            plays[$0] > plays[$1] || (plays[$0] == plays[$1] && $0 < $1)
        }
    }
    
    var result = [Int]()
    
    hashTable.values.sorted(by: { $0.count > $1.count }).forEach { (x, _) in
        result.append(x.first!)
        if x.indices.contains(1) {
            result.append(x[1])
        }
    }
    
    return result
}