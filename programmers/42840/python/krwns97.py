def calculate_result(p_answer,answer):
    result=0
    for i in range(len(answer)):
        if p_answer[i%len(p_answer)] == answer[i]:
            result+=1
    return result

def solution(answers):
    p1_answer=[1,2,3,4,5]
    p2_answer=[2,1,2,3,2,4,2,5]
    p3_answer=[3,3,1,1,2,2,4,4,5,5]
    p1=calculate_result(p1_answer,answers)
    p2=calculate_result(p2_answer,answers)
    p3=calculate_result(p3_answer,answers)
    #print("{0} {1} {2}".format(p1,p2,p3))
    
    result=[]
    if (p1>=p2) and (p1>=p3):
        result.append(1)
    if (p2>=p1) and (p2>=p3):
        result.append(2)
    if (p3>=p2) and (p3>=p1):
        result.append(3)
    return result