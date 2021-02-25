//https://programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var d = [Int: (combinations: [String:Int], max: Int)]()
    d.set(course)
    
    var menu = [String]()
    
    for order in orders {
        let order = order.sorted()
        for length in course {
            order.combination(to: &d[length]!, r: length, index: 0, selected: [])
        }
    }
    
    for length in course {
        if d[length]!.max < 2 { continue }
        
        let max = d[length]!.max
        let combinations = d[length]!.combinations.filter { $0.value == max }
        
        menu.append(contentsOf: combinations.keys)
    }
    
    return menu.sorted()
}

fileprivate extension Dictionary where Key == Int, Value == (combinations: [String:Int], max: Int) {
    mutating func set(_ r: [Int]) {
        for length in r {
            self[length] = ([String:Int](), 0)
        }
    }
}

fileprivate extension Array where Element == Character {
    
    func combination(to t: inout (combinations: [String:Int], max: Int), r: Int, index: Int, selected: [Character]) {
        if r == 0 {
            let c = String(selected)
            if t.combinations[c] != nil {
                t.combinations[c]! += 1
            } else {
                t.combinations[c] = 1
            }
            if t.max < t.combinations[c]! {
                t.max = t.combinations[c]!
            }
        } else if index == self.count {
            return
        } else {
            var newSelected = selected
            newSelected.append(self[index])
            combination(to: &t, r: r-1, index: index+1, selected: newSelected)
            combination(to: &t, r: r, index: index+1, selected: selected)
        }
    }
}

