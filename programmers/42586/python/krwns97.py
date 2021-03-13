#기능개발
#https://programmers.co.kr/learn/courses/30/lessons/42586

def solution(progresses, speeds):
    end_day=[0 for i in range(len(progresses))]
    for i in range(len(end_day)):
      end_day[i]=int((100-progresses[i])/speeds[i])
      if (100-progresses[i])%speeds[i]!=0:
        end_day[i]+=1
    #print(end_day)

    answer = []
    day=end_day[0]
    count=0
    for i in range(len(end_day)):
      if day>=end_day[i]:
        count+=1
      else:
        day=end_day[i]
        answer.append(count)
        count=1
    answer.append(count)
    #print(answer)
    return answer
