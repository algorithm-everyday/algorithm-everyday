#https://programmers.co.kr/learn/courses/30/lessons/42883
#큰수만들기

def find_max(arr,start,end):
    max_value=-1
    for i in range(start,end+1):
        if int(arr[i])>max_value:
            max_value=int(arr[i])
            loc=i
        if int(arr[i])==9:
            max_value=9
            loc=i
            return max_value,loc
    return max_value,loc

def solution(number,k):
    lenght=len(number)
    start=0
    answer=''
    for i in range(lenght-k,0,-1):#전체 길이중 k개 빼고 pick
        num,loc=find_max(number,start,lenght-i)
        answer+=str(num)
        start=loc+1
        #print(start)
    return answer