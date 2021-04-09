#https://programmers.co.kr/learn/courses/30/lessons/42860
#조이스틱

def how_far(arr,loc,dir):
    count=0
    if dir=='L':
        for i in range(1,len(arr)):
            count+=1
            if arr[loc-i]!=0:
                return count
    elif dir=='R':
        for i in range(1, len(arr)):
            count += 1
            if arr[loc + i] != 0:
                return count
    return 0

def min_move(arr):
    loc=0
    move=0
    arr[0]=0

    while True:
        left=how_far(arr,loc,'L')
        right=how_far(arr,loc,'R')

        if left>=right:#오른쪽 이동
            move+=right
            loc+=right
            arr[loc]=0
        else:
            move+=left
            loc-=left
            arr[loc]=0

        if max(arr)==0:#모두다 A
            return move

def solution(name):
    arr=[]

    for i in range(len(name)):
        temp=ord(name[i])-ord('A')
        if temp>13:
            arr.append(-temp+26)
        else:
            arr.append(temp)

    return sum(arr)+min_move(arr)
