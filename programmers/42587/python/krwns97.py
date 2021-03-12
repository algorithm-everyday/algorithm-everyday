#프린터
#https://programmers.co.kr/learn/courses/30/lessons/42587

def find_max(arr,loc):
    m=max(arr)
    for i in range(loc,len(arr)):
      if arr[i]==m:
        return i
    for i in range(loc):
      if arr[i]==m:
        return i
      
def solution(priorities, location):
    que=[]
    loc=0
    for i in range(len(priorities)):
      loc=find_max(priorities,loc)
      if loc==location:
        return len(que)+1
      que.append(priorities[loc])
      # priorities=priorities[0:loc]+priorities[loc+1:len(priorities)]
      priorities[loc]=0
      #print(priorities)
      #print(que)
