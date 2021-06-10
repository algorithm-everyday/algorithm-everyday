import Foundation

// O(n^2)
func solution(_ s:String) -> Int {
    let s = s.map { $0 }
    var result = 0
    // O(n)
    for x in 0..<s.count {
        var stack = [Character]()
        // O(n)
        (s[x...] + s[0..<x]).forEach {
            if let peek = stack.last, peek.matches($0) {
                stack.popLast()!
            } else {
                stack.append($0)
            }
        }
        if stack.isEmpty { result += 1 }
    }
    
    return result
}

typealias Parenthesis = Character

extension Parenthesis {
    func matches(_ p: Parenthesis) -> Bool {
        switch self {
        case "(": return p == ")"
        case "{": return p == "}"
        case "[": return p == "]"
        default: return false
        }
    }
}
