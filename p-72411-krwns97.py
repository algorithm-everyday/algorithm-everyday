#메뉴 리뉴얼
#https://programmers.co.kr/learn/courses/30/lessons/72411
from itertools import combinations

def make_combination(order,food_num):
    arr=list(combinations(order, food_num))#조합 뽑기
    #arr는 ('A','B'),('A','C')꼴로 저장
    comb=[]
    for i in range(len(arr)):#문자열로 변환
        temp=''
        for j in range(len(arr[i])):
            temp+=arr[i][j]
        comb.append(temp)
    return comb

def cycle(orders,food_num):
    arr=[]
    for i in range(len(orders)):# 주문 속에서 조합가능한 모든 경우 arr에 저장
        arr+=make_combination(orders[i],food_num)
    max=-1
    max_arr={}
    for i in arr:
        try:
            max_arr[i]+=1
            if max<=max_arr[i]:
                max=max_arr[i]
        except: max_arr[i]=1
    #print(max,max_arr)
    answer=[]
    for i in max_arr:
        if max_arr.get(i)==max:
            answer.append(i)

    return answer

def solution(orders, course):
    answer = []
    for i in range(len(orders)):#요리 정렬
        orders[i]=sorted(orders[i])
    for food_num in course: #food_num 해당하는 요리 반환
        answer+=cycle(orders,food_num)
    answer.sort()
    return answer
