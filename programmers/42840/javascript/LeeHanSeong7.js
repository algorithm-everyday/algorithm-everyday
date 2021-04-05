function solution(answers) {
    var answer = [];
    let count = [0,0,0];
    let types = [];
    types[0] = [1,2,3,4,5];
    types[1] = [2,1,2,3,2,4,2,5];
    types[2] = [3,3,1,1,2,2,4,4,5,5];

    for(let i=0; i<answers.length; i++){
        if (types[0][i%types[0].length] == answers[i]) count[0] += 1;
        if (types[1][i%types[1].length] == answers[i]) count[1] += 1;
        if (types[2][i%types[2].length] == answers[i]) count[2] += 1;
    }
    
    const max = Math.max.apply(null,count);

    for(let i=0; i<count.length; i++){
        if (count[i] == max) answer.push(i+1);
    }

    return answer;
}