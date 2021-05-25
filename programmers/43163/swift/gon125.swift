import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) { return 0 }
    var target = target
    let visited = Array(repeating: false, count: words.count)
    return words.dfs(begin, &target, visited, 0)
}

extension Array where Element == String {
    func dfs(_ current: String, _ target: inout String, _ visited: [Bool],_ steps: Int) -> Int {
        if current == target { return steps }
        if steps == self.count { return 0 }
        var min = Int.max
        var visited = visited
        for i in 0..<visited.count {
            if visited[i] != true && isConvertable(from: current, to: self[i]) == true {
                visited[i] = true
                let result = dfs(self[i], &target, visited, steps + 1)
                if min > result { min = result }
            }
        }
        return min
    }
}

func isConvertable(from s1: String, to s2: String) -> Bool {
    var count = 0
    let s1 = Array(s1)
    let s2 = Array(s2)
    for i in 0..<s1.count {
        if s1[i] != s2[i] {
            count += 1
        }
    }
    return count == 1
}
