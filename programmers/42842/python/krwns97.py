def make_sosu(num):
    sosu=[]
    for i in range(3,int(num**0.5+1)):
        if num%i==0:
            temp=[]
            temp.append(i)
            temp.append(int(num/i))
            sosu.append(temp)
    return sosu

def solution(brown, yellow):
    answer = []
    total=brown+yellow
    sosu=make_sosu(total)
    #print(sosu)
    for s in sosu:
        if brown==s[1]*2+s[0]*2-4:
            answer.append(s[1])
            answer.append(s[0])
            return answer
    return answer