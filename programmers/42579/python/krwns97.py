#베스트앨범
#https://programmers.co.kr/learn/courses/30/lessons/42579

def solution(genres, plays):
    answer = []
    result=[]

    #reuslt=[장르,장르재생총합,[노래재생횟수,고유번호]]
    for i in range(len(genres)):
        is_exist = False
        for j in range(len(result)):
            if result[j][0]==genres[i]: #기존에 존재한 경우
                playCount_num=[]
                playCount_num.append(plays[i])
                playCount_num.append(i) # 추가 [노래재생횟수,고유번호] 입력
                
                result[j][1]+=plays[i] # 재생횟수총합+
                new=result[j][2] # 기존 [노래재생횟수,고유번호] 입력
                new.append(playCount_num) # 추가

                result[j][2]=new #Update
                is_exist=True
                break

        # 기존에 없던 경우
        if is_exist==False:
            playCount_num=[]
            
            temp=[]
            temp.append(plays[i])
            temp.append(i) #[노래재생횟수,고유번호] 입력
            playCount_num.append(temp) #[[노래재생횟수,고유번호]]

            dic=[]
            dic.append(genres[i])
            dic.append(plays[i]) #[장르이름, play 수])
            dic.append(playCount_num)

            result.append(dic)

    result.sort(key=lambda x:x[1],reverse=True)
    #print(result) #[['pop', 3100, [[600, 1], [2500, 4]]], ['classic', 1450, [[500, 0], [150, 2], [800, 3]]]]

    for r in result:
        r[2].sort(key=lambda x:x[0],reverse=True)
        for j in range(len(r[2])):
            if j>=2:#최대2개까지 출시함으로
                break
            answer.append(r[2][j][1])
    return answer
