import math
from itertools import permutations

def is_it_prime(num):
    if num==0 or num==1:
        return False
    n=math.sqrt(num)
    n=int(n)+1
    for i in range(2,n):
        if num%i==0:
            return False
    return True

def solution(numbers):
    answer = 0
    arr=[]
    new_arr=[]
    l=len(numbers)
    total=0
    a=[]
    for i in range(1,l+1):
        a+=list(permutations(numbers,i))
    for i in range(len(a)):
        temp=''
        for j in range(len(a[i])):
            temp+=a[i][j]
        arr.append(int(temp))
    for v in arr:
        if v not in new_arr:
            new_arr.append(v)
    for i in range(len(new_arr)):
        if is_it_prime((new_arr[i]))==True:
            answer+=1
    return answer