function solution(numbers) {
    var answer = '';

    let NtoS = numbers.map(e => {return e + "";});

    NtoS.sort((a,b)=>{
        const A = parseInt(a+b);
        const B = parseInt(b+a);
        return B-A;
    });
    
    if (NtoS[0] == 0) return "0";
    
    NtoS.forEach(e=>{
        answer = answer + e;
    })
    
    return answer;
}