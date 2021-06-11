function solution(s) {
    var answer = 0;
    function isCorrect(str){
        const right = [']', ')', '}'];
        const left = ['[', '(', '{'];
        let stack = [];
        for(let i=0; i<str.length; i++){
            let char = str.charAt(i);
            if (left.includes(char)){
                stack.push(char);
            }
            else{
                if (left.indexOf(stack.pop()) != right.indexOf(char))
                    return false;
            }  
        }
        if (stack.length == 0)
            return true;
        else   
            return false;
    }
    for(let i=0; i<s.length; i++){
        const newstr = s.slice(i,s.length)+s.slice(0,i);
        if (isCorrect(newstr)){
            answer += 1;
        }
    }
    return answer;
}