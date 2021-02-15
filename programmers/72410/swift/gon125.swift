// https://programmers.co.kr/learn/courses/30/lessons/72410

import Foundation

func solution(_ new_id:String) -> String {
    let fisrt = new_id.lowercased()
    
    let second = fisrt.replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: .regularExpression)
    
    let third = second.replacingOccurrences(of: "\\.{2,}", with: ".", options: .regularExpression)
    
    let fourth = third.replacingOccurrences(of: "^\\.|\\.$", with: "", options: .regularExpression)
    
    let fifth = fourth.isEmpty ? "a" : fourth
    
    let sixth = fifth
        .prefix(15)
        .replacingOccurrences(of: "\\.$", with: "", options: .regularExpression)
    
    let seventh = sixth.count < 3 ? sixth.concat(sixth.last!, length: 3) : sixth

    return seventh
}

fileprivate extension String {
    func concat(_ char: Character, length: Int) -> String {
        var result = self
        for _ in self.count..<length {
            result += String(char)
        }
        return result
    }
}



