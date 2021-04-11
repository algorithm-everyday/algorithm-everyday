
def cal(i,j):
    a=str(i)+str(j)
    b=str(j)+str(i)
    a=int(a)
    b=int(b)
    #print(a,b)
    if a>b: return 1
    elif a==b: return 0
    else: return -1

def quicksort(arr):
    if len(arr) <=1 : return arr
    pivot=arr[len(arr)//2]
    l,e,b=[],[],[]
    for i in range(len(arr)):
        result=cal(arr[i],pivot)
        #print(result)
        if result==1 : l.append(arr[i])
        elif result==-1 : b.append(arr[i])
        else: e.append(arr[i])
    return quicksort(l)+e+quicksort(b)

def solution(numbers):
    answer = ''
    numbers=quicksort(numbers)
    if numbers[0]==0:
        return '0'
    for i in range(len(numbers)):
        answer+=str(numbers[i])
    return answer
