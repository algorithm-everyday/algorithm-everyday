//https://programmers.co.kr/learn/courses/30/lessons/72412
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var hashTables = [String : [Int]]()
    var result: [Int] = []
    
    for info in info {
        let data = info.split(separator: " ").map {String($0)}
        let score = Int(data[4])!
        let keys = [data[0], "-"] * [data[1], "-"] * [data[2], "-"] * [data[3], "-"]
        
        for key in keys {
            if hashTables[key] == nil {
                hashTables[key] = []
            }
            hashTables[key]!.append(score)
        }
    }
    
    for key in hashTables.keys {
        hashTables[key]!.sort()
    }
    
    for query in query {
        let data = query
            .replacingOccurrences(of: "and", with: "")
            .split(separator: " ").map { String($0) }
        let score = Int(data[4])!
        let key = data[0] + data[1] + data[2] + data[3]
        if let index = hashTables[key]?.lowerBound(key: score) {
            let count = hashTables[key]!.suffix(from: index).count
            result.append(count)
        } else {
            result.append(0)
        }
    }
    
    return result
}

extension Array where Element == Int {
    func lowerBound(key: Int) -> Int? {
        if count == 0 { return nil }
        if count == 1 { return self.first! >= key ? 0 : nil }
        
        var low = startIndex
        var high = endIndex - 1
        while low < high {
            let mid = low + (high - low) / 2
            if self[mid] >= key {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return self[high] < key ? nil : high
    }
}

extension Array where Element == String {
    static func *(lhs: [String], rhs: [String]) -> [String] {
        var result = [String]()
        
        for s1 in lhs {
            for s2 in rhs {
                result.append(s1+s2)
            }
        }
        
        return result
    }
}