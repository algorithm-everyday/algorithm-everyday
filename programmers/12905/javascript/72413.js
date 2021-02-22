function solution(n, s, a, b, fares) {
    var answer = null;
    
    //
    var fareMap = {};
    for(var i = 1; i<=n;i++){
        fareMap[i] = [];
    }
    fares.forEach(e=>{
       fareMap[e[0]].push([e[1], e[2]]);
       fareMap[e[1]].push([e[0], e[2]]);
    });
    //
    function doBF_Algo(n, start, fareMap){
        var result = [];
        //
        for (let i=0; i<= n; i++){
            result[i] = {
                'cost' : null,
                //'route' : [],
            };
        }
        result[start] = {
                'cost' : 0,
                //'route':[[start]],
        };
        
        fareMap[start].forEach(e=>{
            result[e[0]].cost = e[1];
            //result[e[0]].route.push([start,e[0]]);
        });
        
        //
        function updateRoute(node){
            fareMap[node].forEach(fare=>{
                let targetNode = result[fare[0]];
                if (result[node].cost != null &&
                    (targetNode.cost == null || (targetNode.cost > fare[1]+result[node].cost))
                ){
                    targetNode.cost = fare[1]+result[node].cost;
                    // targetNode.route = result[node].route.map(routeItem=>{
                    //     return routeItem.concat([fare[0]]);
                    // });
                    updateRoute(fare[0]);
                }   
                // else if (targetNode.cost == fare[1]+result[node]){
                //     targetNode.route.push(result[node].route.concat([fare[0]]));
                // }
                
            });
        }
        for(var i=1;i<=n;i++){
            if (i == start) continue;
            updateRoute(i);
        }
            
        return result;
    }
    
    let S_map = doBF_Algo(n,s,fareMap);
    let A_map = doBF_Algo(n,a,fareMap);
    let B_map = doBF_Algo(n,b,fareMap);
    
    for(let i = 1; i<=n;i++){
        if (S_map[i].cost == null || A_map[i].cost == null || B_map[i].cost == null) continue;
        let temp = S_map[i].cost+A_map[i].cost+B_map[i].cost;
        if (answer == null) answer = temp;
        else if (answer > temp) {
            answer = temp;   
        }
    }
    
    return answer;
}