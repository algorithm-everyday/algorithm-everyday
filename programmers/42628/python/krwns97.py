#https://programmers.co.kr/learn/courses/30/lessons/42628
#이중우선순위큐

import heapq as h

def solution(operations):
    answer = []
    max_heap=[]
    min_heap=[]
    len_heap=0
    for i in range(len(operations)):
        op = operations[i].split(' ')
        num=int(op[1])

        if op[0]=='I':
            h.heappush(max_heap,-num)
            h.heappush(min_heap,num)
            len_heap+=1
        elif op[0]=="D" and len_heap!=0:
            len_heap -= 1
            if num==-1:
                h.heappop(min_heap)
                del max_heap[len_heap]
            else:
                h.heappop(max_heap)
                del min_heap[len_heap]
     
    if min_heap==[] or max_heap==[]:
        return [0,0]
   
    return [-h.heappop(max_heap),h.heappop(min_heap)]
