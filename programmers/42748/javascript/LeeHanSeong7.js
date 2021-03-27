function solution(array, commands) {
    return commands.map(e=>{
        return array.slice(e[0]-1, e[1]).sort((a,b)=>{
            return parseInt(a) - parseInt(b);
        })[e[2]-1];
    });
}