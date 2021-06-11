import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var result = ["ICN"]
    let isTicketUsed = Array(repeating: false, count: tickets.count)
    tickets.dfs("ICN", isTicketUsed, 0, &result)
    return result
}

extension Array where Element == [String] {
    func dfs(_ current: String, _ isTicketUsed: [Bool], _ usedTicketCount: Int, _ route: inout [String]) -> Bool {
        if usedTicketCount == self.count { return true }
        var isTicketUsed = isTicketUsed
        
        for i in self.indices {
            if self[i][0] == current && !isTicketUsed[i] {
                isTicketUsed[i] = true
                route.append(self[i][1])
                let found = dfs(self[i][1], isTicketUsed, usedTicketCount+1, &route)
                if found { return true }
                isTicketUsed[i] = false
                route.popLast()!
            }
        }
        return false
    }
}
