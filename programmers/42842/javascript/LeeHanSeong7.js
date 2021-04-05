function solution(brown, yellow) {
    var answer = [];
    
    const total = brown+yellow;
    
    for(let height = 3; height<=Math.sqrt(total); height++){
        const width = total/height;
        if (width % 1 != 0) continue;

        if ((width-2)*(height-2) == yellow){
            answer = [width, height];
            break;
        }
    }
    
    return answer;
}