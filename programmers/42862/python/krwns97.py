#https://programmers.co.kr/learn/courses/30/lessons/42862
#체육복
def solution(n, lost, reserve):
    lost.sort()
    reserve.sort()

    if lost == reserve:
        return n
    
    for student in range(1,n+1):
        if student in lost and student in reserve:
            lost.remove(student)
            reserve.remove(student)
        
    borr=0
    for i in range(len(lost)):
        if lost[i] + 1 in reserve:
            borr+=1
            reserve.remove(lost[i]+1)
        elif lost[i] - 1 in reserve:
            borr += 1
            reserve.remove(lost[i] - 1)

    answer = n - len(lost) + borr
    # print(lost,borr)
    return answer