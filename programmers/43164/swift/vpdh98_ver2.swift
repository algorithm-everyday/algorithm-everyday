import Foundation

extension Array where Element == [String]{
    func gogogo(_ airport:String,_ tStack: inout Array<String>,_ isVisited: inout [Bool],_ visitCount: inout Int,_ preIndex:Int)->Bool{
        var endGame:Bool = false
        if self.count == visitCount{
            return true
        }
        for i in self.indices{
            if airport==self[i].first! && !isVisited[i]{
                tStack.append(self[i].last!)
                isVisited[i] = true
                visitCount+=1
                endGame = self.gogogo(self[i].last!,&tStack,&isVisited,&visitCount,i)
            }
        }
        if endGame { return true }
        tStack.remove(at:tStack.count-1)
        isVisited[preIndex] = false
        visitCount-=1
        return false
    }
}


func solution(_ tickets:[[String]]) -> [String] {
    let startAirport = "ICN"
    var tickets = tickets.sorted {$0.last! < $1.last!}
    var tStack:Array<String> = Array<String>()
    var isVisited:Array<Bool> = Array(repeating:false,count:tickets.count)
    var visitCount = 0
	
    tStack.append(startAirport)
    tickets.gogogo(startAirport,&tStack,&isVisited,&visitCount,0)
    
    return tStack
}
