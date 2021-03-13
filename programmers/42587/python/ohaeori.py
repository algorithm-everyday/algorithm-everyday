from collections import deque

def solution(priorities, location):
    answer = 0
    stk = []
    que = deque()
    idx=0
    lst_max = sorted(priorities,reverse=True)
    for i in range(len(priorities)):
        que.append([priorities[i],i])

    
    while(len(que)):
        cur = que.popleft()
        if cur[0] == lst_max[idx]:
            if cur[1] == location:
                return idx+1
            
            idx +=1
        else :
            que.append(cur)
    

    return answer