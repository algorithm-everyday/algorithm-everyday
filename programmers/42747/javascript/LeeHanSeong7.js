function solution(citations) {
    let array = citations.sort((a,b)=> {return b-a;});

    for(let i=0; i<array.length ;i++){
        if (array[i] <= i)
            return i;
    }
    return citations.length;
}