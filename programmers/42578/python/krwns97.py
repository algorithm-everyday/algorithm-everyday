#위장
#https://programmers.co.kr/learn/courses/30/lessons/42578

def solution(clothes):
    answer=1
    dic={}
    for c in clothes:
        name=c[0]
        t=c[1]
        if t in dic.keys():
            dic[t]+=1
        else:
            dic[t]=1
        #print(dic)
    for cloth_name,count in dic.items():
        answer*=count+1
    return answer-1
