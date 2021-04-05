function solution(numbers) {
    var answer = 0;
    const numberList = numbers.split('');
    const numCount = {};
    const primeList = [];
    numberList.forEach(e => {
        if (numCount[e] == undefined) numCount[e] = 1;
        else numCount[e] += 1;
    });
    let max = "";
    numberList.sort((a, b) => { return b - a }).forEach(e => { max += e; });
    max = parseInt(max);

    for (let i = 2; i <= max; i++) {
        let isPrime = false;
        for (let j = 0; j < primeList.length; j++) {
            if (primeList[j] > Math.sqrt(i)) break;
            if (i % primeList[j] == 0) {
                isPrime = true;
                break;
            };
        }
        if (isPrime == true) continue;
        primeList.push(i);
    }
    for (let i = 0; i < primeList.length; i++) {
        let temp = (primeList[i] + "").split('');
        const localCount = {};
        let isTarget = true;
        for (let j = 0; j < temp.length; j++) {
            if (numCount[temp[j]] == undefined) {
                isTarget = false;
                break;
            }
            else if (localCount[temp[j]] == undefined) {
                localCount[temp[j]] = 1;
            }
            else {
                if (numCount[temp[j]] == localCount[temp[j]]) {
                    isTarget = false;
                    break;
                }
                localCount[temp[j]] += 1;
            }
        }
        if (isTarget == true) answer += 1;
    }

    return answer;
}