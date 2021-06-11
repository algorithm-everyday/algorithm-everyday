import Foundation

func _1Step(_ id:String)->String{
    return id.lowercased()
}

func _2Step(_ id:String)->String{
    return id.components(separatedBy:["~","!","@","#","$","%","^","&","*","(",")","=","+","[","{","]","}",":","?",",","<",">","/"]).joined()
}

func _3Step(_ id:String)->String{
    var returnId:String = ""
    var preChar:Character = " "
    for char in id{
        if preChar == char && char == "."{
           continue 
        }
        returnId.append(char)
        preChar = char
    }
    return returnId
}

func _4Step(_ id:String)->String{
    return id.trimmingCharacters(in: ["."])
}

func _5Step(_ id:String)->String{
    if id == ""{
        return "a"
    }
    return id
}

func _6Step(_ id:String)->String{
    var returnId:String = ""
    var idCount:Int = 0
    if id.count > 15{
        for char in id{
            if idCount > 14{
                returnId = _4Step(returnId)
                return returnId
            }
            returnId.append(char)
            idCount+=1
        }
    }
    return id 
}

func _7Step(_ id:String)->String{
    var returnId:String = id
    while returnId.count < 3{
        returnId.append(returnId.last!)
    }
    return returnId
}

func solution(_ new_id:String) -> String {
    var modifyId:String = _1Step(new_id)
    modifyId = _2Step(modifyId)
    modifyId = _3Step(modifyId)
    modifyId = _4Step(modifyId)
    modifyId = _5Step(modifyId)
    modifyId = _6Step(modifyId)
    modifyId = _7Step(modifyId)
    
    return modifyId
}
