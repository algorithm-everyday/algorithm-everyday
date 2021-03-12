import math
def solution(progresses, speeds):
    answer = []
    max = math.ceil((100-progresses[0])/speeds[0])
    cnt = 1
    for i in range(1,len(progresses)):
        if max<math.ceil((100-progresses[i])/speeds[i]):
            max = math.ceil((100-progresses[i])/speeds[i])
            answer.append(cnt)
            cnt = 1
        else:
            
            cnt += 1
    answer.append(cnt)
    return answer