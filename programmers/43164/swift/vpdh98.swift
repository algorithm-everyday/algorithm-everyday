import Foundation

class Ticket: CustomStringConvertible{
    var go:String
    var to:String
    var closeWay:Bool = false
    
    init(_ go:String,_ to:String){
        self.go = go
        self.to = to
    }
    
    public var description:String{
        return "[\(go),\(to)]"
    }
}

class Stack<T>:CustomStringConvertible{
    var array:[T] 
    var count:Int = 0
    
    init(){
        array = [T]()
    }
	
    func push(_ element:T){
        array.append(element)
        count+=1
    }
    
    func pop()->T{
        let temp = array.last!
        array.remove(at:array.count-1)
        count-=1
        return temp 
    }
	
	func front()->T{
        let temp = array.first!
        array.remove(at:0)
        count-=1
        return temp 
    }
	public var description:String{
        return array.description
	}
	
	
}

class KoreaAir{
    let startAirport:String = "ICN"
    var pathStack:Stack<String> = Stack<String>()
    var ticketStack:Stack<Ticket> = Stack<Ticket>()
    var tickets:[Ticket] = [Ticket]()
    
    func toTickets(_ tics:[[String]]){
        for strings in tics{
            tickets.append(Ticket(strings.first!,strings.last!))
        }
    }
    
    func allClose(_ ways:[Ticket])->Bool{
        for w in ways{
            if w.closeWay{
                return false
            }
        }
        return true
    }
	
	func ticketToPathString()->[String]{
        var returnPath:[String] = [String]()
        var ticket:Ticket = ticketStack.front()
        returnPath.append(ticket.go)
        while ticketStack.count != 0{
            returnPath.append(ticket.to)
            ticket = ticketStack.front()
        }
        returnPath.append(ticket.to)
        return returnPath
    }
	
	func takeTicket(_ way:String)->[Ticket]{
		var returnTickets:[Ticket] = [Ticket]()
		var removeCount:Int = 0
		for i in 0..<tickets.count{
            if tickets[i-removeCount].go == way{
                returnTickets.append(tickets[i-removeCount])
                tickets.remove(at:i-removeCount)
                removeCount+=1
            }
        }
		returnTickets = returnTickets.sorted(by:{$0.to < $1.to})
		return returnTickets
	}
	
	func findWay(_ searchTickets:inout [Ticket]){
		searchTickets.remove(at:0)
        for ticket in searchTickets{
            tickets.append(ticket)
        }
	}
	
	func findNotCloseWay(_ searchTickets:inout [Ticket])->Ticket{
		var temp = searchTickets.first!
		for i in 0..<searchTickets.count{
			if !searchTickets[i].closeWay{
				temp = searchTickets[i]
				searchTickets.remove(at:i)
				for ticket in searchTickets{
					tickets.append(ticket)
				}
				break
			}
		}
		return temp
	}
    
    func search(_ way:String)->Ticket{
        var searchTickets:[Ticket] = [Ticket]()
        searchTickets = takeTicket(way)
		
        if searchTickets.count == 0{
            return Ticket("ERR","OR!")
        }
		
        var temp = searchTickets.first!
        if !temp.closeWay || allClose(searchTickets){ //닫히지 않은 길 우선으로 탐색,모두 닫혀있다면 알파벳 우선순위로 탐색
            findWay(&searchTickets)
        }else{
            temp = findNotCloseWay(&searchTickets)
        }
        return temp
    }
    
	func recallTicket(_ ct:Ticket)->Ticket{
		var currentTicket = ct
		var popTickets:[Ticket] = [Ticket]()
		while currentTicket.go == "ERR"{      //현재 왓던 길이 아닌 이전 길을 찾음
			currentTicket = ticketStack.pop()
			currentTicket.closeWay = true		//길 닫음
			popTickets.append(currentTicket)	
			currentTicket = search(currentTicket.go)
		}
		for t in popTickets{				//닫은 길들을 다시 tickets에 추가
			tickets.append(t)
		}
		return currentTicket
	}
	
    func gogogo()->[String]{
        var currentTicket = search(startAirport) //시작 지점
		var popTickets:[Ticket] = [Ticket]()
        ticketStack.push(currentTicket)
		
        while tickets.count != 0{ //티켓을 모두 사용할 때까지
            currentTicket = search(currentTicket.to)
            if currentTicket.go == "ERR"{ //막다른 길일때
				currentTicket = recallTicket(currentTicket) //그 길을 가는데 ㎢ 티켓을 다시 리콜하고 갈래길에서 가지 않은 다른 길 반환
                ticketStack.push(currentTicket)
            }
            else{
                ticketStack.push(currentTicket)
            }
        }
        return ticketToPathString()
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    var koreaAir:KoreaAir = KoreaAir()
    koreaAir.toTickets(tickets)
    return koreaAir.gogogo()
}
