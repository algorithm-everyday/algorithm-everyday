function solution(sales, links) {
    var teamInfo = {};
    links.forEach(e=>{
        if (teamInfo[e[0]] == undefined){
            teamInfo[e[0]] = [e[1]];
        }
        else{
            teamInfo[e[0]].push(e[1]);
        }
    });
    const teamList = Object.keys(teamInfo).map(e=>{
        return parseInt(e);
    });
    
    var minCostTree = {};
    
    function makeMinTree(node,minCostTree){
        teamInfo[node].forEach(e=>{
            if (teamInfo[e] === undefined){
                minCostTree[e] = sales[e-1];
            }
            else
                makeMinTree(e,minCostTree);
        });
        if (node == 1) return;
        let min = sales[node-1];
        teamInfo[node].forEach(e=>{
            if (minCostTree[e] < min)
                min = minCostTree[e];
        });
        minCostTree[node] = sales[node-1] - min ;
    }
    makeMinTree(1,minCostTree);
    
    // 값 계산
    var answer = 0;
    teamList.forEach(e=>{
        let min = sales[e-1];
        teamInfo[e].forEach(e=>{
            if (minCostTree[e] < min)
                min = minCostTree[e];
        });
        answer += min;
    });
    
    return answer;
}