import Foundation

// O(n^2)
func solution(_ s:String) -> Int {
    let s = s.map { $0 }
    var result = 0
    // O(n)
    for x in 0..<s.count {
        if (s[x...] + s[0..<x]).isCorrect {
            result += 1
        }
    }
    
    return result
}

extension Sequence where Element == Parenthesis {
    var isCorrect: Bool {
        var stack = [Character]()
        // O(n)
        for c in self {
            if c.isLeft { stack.append(c) }
            else if let peek = stack.last, peek.matches(c) {
                stack.popLast()!
            } else { return false }
        }
        if stack.isEmpty { return true }
        else { return false }
    }
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
    
    var isLeft: Bool {
        switch self {
        case "(", "{", "[": return true
        default: return false
        }
    }
}
