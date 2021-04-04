import Foundation
 /// - Complexity: O(n^2)
func solution(_ numbers:String) -> Int {
    return allPermutations(of: numbers).filter { $0.isPrime }.count
}

func allPermutations(of string: String) -> Set<Int> {
    return Set(permutation(upTo: string.count, string.map { String($0) }).map { Int($0)! })
}

func permutation(upTo r: Int, _ string: [String]) -> Set<String> {
    if r == 1 { return Set(string) }
    
    var set = Set<String>()
    for i in 0..<string.count {
        let char = string[i]
        var temp = string
        temp.remove(at: i)
        
        let permWithoutChar = permutation(upTo: r-1, temp)
        let permWithChar = permWithoutChar.map { char + $0 }
        set = set.union(permWithoutChar).union(permWithChar)
    }
    return set
}

extension Int {
    var isPrime: Bool {
        guard self >= 2 else { return false }
        guard self >= 4 else { return true }
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 { return false }
        }
        return true
    }
}
