import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var uf = UnionFind(size: n)
    
    for i in 0..<n {
        for j in 0..<n {
            guard i != j else { continue }
            if computers[i][j] == 1 && !uf.areInSameSet(i, j)  {
                uf.union(i, j)
            }
        }
    }
    return Set((0..<n).map { uf.setIndexOf($0) }).count
}

struct UnionFind {
    var parents: [Int]
    
    init(size n: Int) {
        self.parents = Array(0..<n)
    }
    
    func areInSameSet(_ n1: Int, _ n2: Int) -> Bool {
        setIndexOf(n1) == setIndexOf(n2)
    }
    
    mutating func union(_ n1: Int, _ n2: Int) {
        let s1 = setIndexOf(n1)
        let s2 = setIndexOf(n2)
        if s1 < s2 {
            parents[s2] = s1
        } else {
            parents[s1] = s2
        }
    }
    
    func setIndexOf(_ i: Int) -> Int {
        if parents[i] == i { return i }
        return setIndexOf(parents[i])
    }
    
    
}
