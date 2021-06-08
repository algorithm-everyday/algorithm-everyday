import Foundation



func canGo(_ word:String,_ begin:String)->Bool{
    var count:Int = 0
    for i in 0..<word.count {
		let index = word.index(word.startIndex, offsetBy:i)
        if word[index] == begin[index]{
            count+=1
        }
    }
    if count >= word.count-1{
        return true
    }
    
    return false
}

func search(_ words:[String],_ queue: inout [String],_ begin:String,_ target:String,_ count:Int,_ isVisited: inout [Bool],_ depth: inout [Int]) -> Int{
    var beg:String = begin
    var visited:[Bool] = isVisited
	var depth = depth
    
    if beg == target{ return count }
    for i in words.indices{
        if canGo(words[i],beg) && !visited[i]{
            queue.append(words[i])
            visited[i] = true
			depth.append(count)
        }
    }
    if queue.count == 0{
        return 0
    }
	
    beg = queue[0]
    queue.remove(at:0)
	var count = depth[0]+1
	depth.remove(at:0)
	var temp = search(words,&queue,beg,target,count,&visited,&depth)	
    return temp
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var count:Int = 0
    var queue:[String] = [String]()
    var visited:[Bool] = Array(repeating: false, count: words.count)
	var depth:[Int] = [Int]()
    count = search(words,&queue,begin,target,count,&visited,&depth)
    return count
}
