//https://programmers.co.kr/learn/courses/30/lessons/72413
import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    let distances = fares.floydWarshall(withOrder: n, initialValue: Int.max / 3)
    
    var minFare = Int.max / 2
    
    for i in 0..<n {
        let currentFare = distances[s-1][i] + distances[i][a-1] + distances[i][b-1]
        if currentFare < minFare {
            minFare = currentFare
        }
    }
    
    return minFare
}

fileprivate extension Array where Element == [Int] {
    func floydWarshall(withOrder order: Int, initialValue: Int) -> [[Int]] {
        var dist = [[Int]](repeating: [Int](repeating: initialValue, count: order), count: order)
        
        for edge in self {
            dist[edge[0]-1][edge[1]-1] = edge[2]
            dist[edge[1]-1][edge[0]-1] = edge[2]
        }
        
        for i in 0..<order {
            dist[i][i] = 0
        }
        
        for k in 0..<order {
            for i in 0..<order {
                for j in 0..<order {
                    if dist[i][k] + dist[k][j] < dist[i][j] {
                        dist[i][j] = dist[i][k] + dist[k][j]
                    }
                }
            }
        }
        
        return dist
    }
}

