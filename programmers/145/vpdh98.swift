import Foundation

func gumsa(_ guharos:[Character])->Bool{
	var guharos:[Character] = guharos
	var gStack:Array<Character> = Array<Character>()
	for guharo in guharos{
        if guharo == "{" || guharo == "[" || guharo == "("{
            gStack.append(guharo)
        } 
        else{
			if gStack.count == 0 { return false }
            var temp = gStack[gStack.count-1]
            gStack.remove(at:gStack.count-1)
            if(temp == "{"&&guharo != "}"){
                return false
            }
            else if(temp == "["&&guharo != "]"){
                return false
            }
            else if(temp == "("&&guharo != ")"){
                return false
            }
        }
    }
    if gStack.count == 0{
	    return true
    }
    else{
        return false
    }
}

func guharo(_ guharos:[Character])->Int{
    var guharos:[Character] = guharos
    var answer:Int = 0
    for i in guharos{
		
    	let find = gumsa(guharos)
		if find{
			answer+=1
		}
    	guharos.append(guharos[0])
    	guharos.remove(at:0)
    }
    return answer
}

func solution(_ s:String) -> Int {
    var chars:[Character] = [Character]()
    for c in s{
        chars.append(c)
    }
    return guharo(chars)
}
