import Foundation

func prioriter(_ priorities:[Int],_ priority:inout Array<Int>){
    var temp:Int = 0
    for i in priorities{
        for j in priorities{
            if i > j{
                priority[temp] += 1
            }
        }
        temp+=1
    }
}

func checkPriority(_ p:Int,_ priority: Array<Int>)->Bool{
    for i in priority{
            if p < i{
                return false
            }
    }
    return true
}

func nextThankyou(_ array:inout Array<Int>){
    var temp = array[array.indices].popFirst()!
    array.append(temp)
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priority:Array<Int> = Array<Int>(repeating:0,count:priorities.count)
    var locations:Array<Int> = Array<Int>(0..<priorities.count)
    var answer:Int = 0
    
    prioriter(priorities,&priority)
    while priority.count != 0{
        if checkPriority(priority[0],priority){
            answer += 1
            if locations[0] == location{
                break
            }
            priority.remove(at:0)
            locations.remove(at:0)
        }
        else{
            nextThankyou(&priority)
            nextThankyou(&locations)
        }
    }
    
    
    
    return answer
    
}
