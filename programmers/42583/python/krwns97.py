#다리를 지나는 트럭
#https://programmers.co.kr/learn/courses/30/lessons/42583

def solution(bridge_length, weight, truck_weights):
    answer = 0
    ing=[]
    ed=[]
    time=[]
    while True:
        if len(ing)==0 and answer!=0: #진행중인것이 없는경우 break(처음제외)
            break

        if len(ing)!=0 and time[0]==bridge_length and answer!=0:#다리를 지난 경우(처음제외)
            ed.append(ing[0])
            del ing[0]
            del time[0]

        if len(truck_weights)!=0:
            if sum(ing)+truck_weights[0]<=weight:#다리에 여유가 생긴 경우
                ing.append(truck_weights[0])
                time.append(0)
                del truck_weights[0]

        for i in range(len(time)):
            time[i]+=1
        answer += 1

    return answer
