function solution(priorities, location) {
    var answer = 0;
    
    const queueMachine = function(){
        this.max = 0;
        this.Q = [];
        
        this.enQ = function(item){
            this.Q.push(item)
        }
        this.deQ = function(){
            return this.Q.shift();
        }
        //
        this.updateMax = function(){
            this.max = Math.max.apply(null, this.Q.map(e => {return e[1]}));
        }
    }
    
    const myQ = new queueMachine();
    
    for(let i=0; i<priorities.length; i++){
        myQ.enQ([i,priorities[i]]);    
    }
    
    myQ.updateMax();

    while(true){
        let item = myQ.deQ();
        
        if (item[1] == myQ.max){
            answer++;
            
            if (item[0] == location) break;
            
            myQ.updateMax();
        }
        else{
            myQ.enQ(item);
        }
    }
    
    return answer;
}