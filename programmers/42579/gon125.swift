import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var hashTable = [String: ([Int], count: Int)]()
    
    for song in plays.indices {
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

    return hashTable.values.sorted { $0.count > $1.count }.flatMap { $0.0.prefix(2) }
}