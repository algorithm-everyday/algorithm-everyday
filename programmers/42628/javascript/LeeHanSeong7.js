function solution(operations) {
    class PriorityQueue{
        Queue = [];

        swap =(a,b)=>{
            const temp = this.Queue[a];
            this.Queue[a] = this.Queue[b];
            this.Queue[b] = temp;
        }

        BottomUp =(index)=>{
            if (index == 0) return;
            let parent = Math.floor((index-1)/2);
            if (this.Queue[parent] < this.Queue[index]){
                this.swap(parent, index);
                this.BottomUp(parent);
            }
        }
        enQueue =(item)=>{
            this.Queue.push(item);
            if (this.Queue.length != 1)
                this.BottomUp(this.Queue.length-1);
        }
        TopDown =(index)=>{
            let left = index*2;
            let right = index*2+1;
            if (this.Queue.length <= left) return;
            else if (this.Queue.length <= right){
                if (this.Queue[left] > this.Queue[index]){
                    this.swap(left, index);
                    this.TopDown(left);
                }
            }
            else{
                const larger = (this.Queue[right]>this.Queue[left])?right:left;
                if (this.Queue[larger] > this.Queue[index]){
                    this.swap(larger, index);
                    this.TopDown(larger);
                }
            }
        }
        deQueueMax =()=>{
            if (this.Queue.length == 0) return null;
            if (this.Queue.length == 1) return this.Queue.pop();

            let res = this.Queue[0];
            this.Queue[0] = this.Queue.pop();

            if (this.Queue.length != 1)
                this.TopDown(0);
            return res;
        }
        deQueueMin =()=>{
            if (this.Queue.length == 0) return null;
            if (this.Queue.length == 1) return this.Queue.pop();

            let index = this.Queue.length-1;
            let parent = Math.floor((index-1)/2);
            let min = this.Queue[index];

            for (let i=index; i>parent; i--){
                if (min > this.Queue[i]){
                    min = this.Queue[i];
                    index = i;
                }
            }

            if (index == this.Queue.length-1) return this.Queue.pop();

            let res = min;

            this.Queue[index] = this.Queue.pop();

            if (this.Queue.length != 1)
                this.BottomUp(index);

            return res;
        }
    }

    const PQ = new PriorityQueue();

    for(let i=0; i< operations.length; i++){
        const opr = operations[i].split(' ');
        switch(opr[0]){
            case "I":
                PQ.enQueue(parseInt(opr[1]));
                break;
            case "D":
                if (opr[1] == 1){
                    PQ.deQueueMax();
                }
                else{
                    PQ.deQueueMin();
                }
                break;
            default: break;
        }
    }

    let max = PQ.deQueueMax();
    if (max == null) return [0,0];
    else{
        let min = PQ.deQueueMin();
        if (min == null) min = max;

        return [max,min];
    }
}