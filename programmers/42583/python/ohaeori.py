from collections import deque
def solution(bridge_length, weight, truck_weights):
    time = 0
    q = deque()
    weight_q = deque(truck_weights) 
    for i in range(bridge_length):
        q.append(0)
    sumq=0
    while q:
        time += 1
        t = q.popleft()
        sumq -= t
        if weight_q:
            if sumq + weight_q[0] <= weight:
                temp = weight_q.popleft()
                q.append(temp)
                sumq += temp
            else:
                q.append(0)
    
    return time