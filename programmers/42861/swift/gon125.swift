import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let costs = costs.sorted { $0[2] < $1[2] }
    var uf = UnionFind(size: n)
    
    var minCost = 0
    var count = 0
    for cost in costs {
        if !uf.areInSameSet(cost[0], cost[1]) {
            minCost += cost[2]
            uf.union(cost[0], cost[1])
            count += 1
        }
        if count == n - 1 { break }
    }
    return minCost
}

struct UnionFind {
    var parent: [Int]
    
    init(size n: Int) {
       parent = Array(0..<n)
    }
    
    public func areInSameSet(_ a: Int, _ b: Int) -> Bool {
        return parentOf(a) == parentOf(b)
    }
    
    public mutating func union(_ a: Int, _ b: Int) {
        let parentOfA = parentOf(a)
        let parentOfB = parentOf(b)
        parent[parentOfB] = parentOfA
    }
    
    private func parentOf(_ a: Int) -> Int {
        if a == parent[a] { return a }
        return parentOf(parent[a])
    }
}
