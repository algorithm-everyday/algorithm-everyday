from collections import defaultdict
def solution(genres, plays):
    answer = []
    dicPls = defaultdict(int)
    dicIdx = defaultdict(dict)
    
    for i in range(len(genres)):
        dicPls[genres[i]] += plays[i]
        dicIdx[genres[i]][i] = plays[i]

    temp = sorted(dicPls.keys(),key=lambda x:-dicPls[x])
    
    for i in temp:
        lst = sorted(dicIdx[i].keys(),key=lambda x:(-dicIdx[i][x],x))
        answer.append(lst[0])
        if(len(lst)>=2):
            answer.append(lst[1])

    return answer